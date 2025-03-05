function motor_speeds = plan_motion_moCap(mocap_pose,path)
   % Robot parameters
    wheelbase = 0.2;  % Distance between wheels (adjust as needed)
    max_speed = 1.0;  % Maximum motor speed

    % Extract robot pose from MoCap
    robot_pose = mocap_pose;  % [x, y, theta]
    x_r = robot_pose(1);
    y_r = robot_pose(2);
    theta_r = robot_pose(3);
%     v_L = 0;
%     v_R = 0;
    % Define lookahead distance
    %lookahead_dist = max(0.3, min(0.8, norm([v_L, v_R]) * 0.5));
    lookahead_dist = 1.5;
    % Find the closest waypoint
    distances = vecnorm(path - [x_r, y_r], 2, 2);
    [~, idx] = min(distances);

    lookahead_point = path(end, :);  % Default to last waypoint
    % Find the lookahead point
    for i = idx:length(path)
        if norm(path(i, :) - [x_r, y_r]) > lookahead_dist
            lookahead_point = path(i, :);
            break;
        end
    end

    % Compute the heading error
    angle_to_target = atan2(lookahead_point(2) - y_r, lookahead_point(1) - x_r);
    heading_error = angle_to_target - theta_r;
    heading_error = atan2(sin(heading_error), cos(heading_error)); % Normalize

    % Convert heading error to differential drive motor speeds
    Kp = -0.8;  % Proportional gain for turning (adjust as needed)
    base_speed = 0.8 * max_speed;  % Base speed for forward movement
    turn_speed = Kp * heading_error;  % Adjust for turning

    % Compute left and right wheel speeds
    v_L = base_speed - turn_speed * wheelbase / 2;
    v_R = base_speed + turn_speed * wheelbase / 2;

    % Limit motor speeds
    v_L = max(-max_speed, min(max_speed, v_L));
    v_R = max(-max_speed, min(max_speed, v_R));

    % Return motor speeds
    motor_speeds = [v_L, v_R];
end
