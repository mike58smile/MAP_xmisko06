function [new_pose] = predict_pose(old_pose, motion_vector, read_only_vars)
%PREDICT_POSE Return the new pose from old_pose and motion vector
    % Extract necessary parameters
    vR = motion_vector(1); % Right wheel speed in percentage
    vL = motion_vector(2); % Left wheel speed in percentage
    dt = read_only_vars.sampling_period; % Time step
    L = read_only_vars.agent_drive.interwheel_dist; % Distance between wheels
    
    % Convert motor speeds to actual velocities (assuming percentage represents a max velocity)
    % max_wheel_speed = 1.0; % Adjust as needed
    % vR = (vR / 100) * max_wheel_speed;
    % vL = (vL / 100) * max_wheel_speed;
    
    % Compute linear and angular velocity
    v = (vR + vL) / 2; % Linear velocity
    omega = (vR - vL) / L; % Angular velocity
    
    % Get old pose
    x = old_pose(1);
    y = old_pose(2);
    theta = old_pose(3);
    
    % Predict new pose using motion model
    theta_new = theta + omega * dt;
    x_new = x + v * dt * cos(theta_new);
    y_new = y + v * dt * sin(theta_new);
    
    % Add Gaussian noise for probabilistic modeling
    noise_std = 0.1; % Adjust noise level
    x_new = x_new + noise_std * randn;
    y_new = y_new + noise_std * randn;
    theta_new = theta_new + (noise_std / 10) * randn; % Less noise on orientation
    
    % Store new pose
    new_pose = [x_new, y_new, theta_new];
end

