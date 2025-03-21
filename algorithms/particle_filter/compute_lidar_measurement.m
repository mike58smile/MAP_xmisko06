function [measurement] = compute_lidar_measurement(map, pose, lidar_config)
%COMPUTE_MEASUREMENTS Compute distances of particles to walls using lidar
    % Extract pose components
    x = pose(1);
    y = pose(2);
    theta = pose(3);
    
    % Get walls from the map
    walls = map.walls;
    
    % Initialize measurement vector
    measurement = zeros(1, length(lidar_config));

    % Loop through each lidar beam direction
    for i = 1:length(lidar_config)
        % Compute absolute ray direction
        ray_direction = theta + lidar_config(i);
        
        % Perform ray casting
        intersections = ray_cast([x, y], walls, ray_direction);
        
        % Compute distances to intersections
        if isempty(intersections)
            measurement(i) = inf; % No intersection means infinite distance
        else
            % Compute Euclidean distances to each intersection point
            distances = vecnorm(intersections - [x, y], 2, 2);
            % Take the closest intersection
            measurement(i) = min(distances);
        end
    end
end

