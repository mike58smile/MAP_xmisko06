function [new_particles] = resample_particles(particles, weights)
%RESAMPLE_PARTICLES Resample particles based on their weights
    % Number of particles
    N = size(particles, 1);
    
    % Compute cumulative sum of weights
    cumulative_weights = cumsum(weights);
    
    % Generate equally spaced target values
    step = 1 / N;
    start = rand * step;  % Random starting point for systematic resampling
    target_values = start:step:1;
    
    % Resampling process
    new_particles = zeros(size(particles));
    index = 1;
    for i = 1:N
        while target_values(i) > cumulative_weights(index)
            index = index + 1;
        end
        new_particles(i, :) = particles(index, :);
    end
end

