function [path] = create_elipse_portion()
% Define ellipse parameters
x_c = 5;  % Center X
y_c = 5;  % Center Y
a = 3;    % Semi-major axis
b = 2;    % Semi-minor axis

% Define start and end points
x_start = 5.3;  y_start = 3.5;  % Example: rightmost point on ellipse
x_end = 8.65;    y_end = 3.5;    % Example: topmost point on ellipse

% Compute theta values for start and end
theta_start = atan2((y_start - y_c) / b, (x_start - x_c) / a);
theta_end = atan2((y_end - y_c) / b, (x_end - x_c) / a);

% Generate arc points
theta = linspace(theta_start, theta_end, 50);  % 50 waypoints for smooth curve
x_arc = x_c + a * cos(theta);
y_arc = y_c + b * sin(theta);

% Store waypoints in public_vars.path
path = [x_arc' y_arc'];
end