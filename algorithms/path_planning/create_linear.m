function [path] = create_linear(x_start,y_start,x_end,y_end,step)
% Compute unit direction vector
direction = [x_end - x_start, y_end - y_start];
direction = direction / norm(direction);  % Normalize to unit length

% Generate path points
path = [x_start, y_start];  % Initialize path
current_point = [x_start, y_start];

while norm(current_point - [x_end, y_end]) > step
    current_point = current_point + step * direction;
    path = [path; current_point];  % Append new point
end

% Add final point
path = [path; x_end, y_end];

end