function [public_vars] = init_particle_filter(read_only_vars, public_vars)
%INIT_PARTICLE_FILTER Summary of this function goes here
    % Number of particles
    N = 100;  % Adjust as needed
    
    % Extract map boundaries
    map_limits = read_only_vars.map.limits;
    x_min = map_limits(1);
    y_min = map_limits(2);
    x_max = map_limits(3);
    y_max = map_limits(4);

    % Initialize random particle poses within the map
    x = x_min + (x_max - x_min) * rand(N, 1);
    y = y_min + (y_max - y_min) * rand(N, 1);
    theta = 2 * pi * rand(N, 1);  % Random orientation between 0 and 2π

    % Store particles
    public_vars.particles = [x, y, theta];
end

