function [path] = create_circle_portion(Sx, Sy, r, angle_start, angle_end, angle_step)
% Generate arc points
if angle_end < angle_start
    angle_step = -1*angle_step;
end
theta = linspace(angle_start, angle_end, round((angle_end - angle_start) / angle_step) + 1);
x_arc = Sx + r * cos(theta);
y_arc = Sy + r * sin(theta);
% Store waypoints in public_vars.path
path = [x_arc' y_arc'];
end