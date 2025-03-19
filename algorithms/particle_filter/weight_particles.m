function [weights] = weight_particles(particle_measurements, lidar_distances)
%WEIGHT_PARTICLES Compute weights for each particle based on lidar measurements
    % Number of particles
    N = size(particle_measurements, 1);

    % Sensor noise standard deviation - from week 1 assignment
    sigma = 0.05; 

    % Compute weight for each particle
    weights = zeros(N, 1);

    for i = 1:N
        % Compute the likelihood using Gaussian probability
        error = lidar_distances - particle_measurements(i, :);
        % Compute the log-likelihood instead of direct multiplication
        likelihoods = exp(-0.5 * (error / sigma).^2);        
        
        % Combine individual likelihoods (assume independence, multiply them)
        weights(i) = prod(likelihoods);
    end

%     if sum(weights) == 0
%         weights = ones(N, 1) / N;
%     else
%         % Normalize weights to sum to 1
%         weights = weights / sum(weights);
%     end
    weights = weights / sum(weights);
end

