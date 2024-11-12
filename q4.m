% Define parameters
std_dev_log = 5.0;           % Standard deviation for the LoG mask
step_size = 0.10;            % Step size for standard deviations
min_std = 3;               % Minimum standard deviation to test
max_std = 6;              % Maximum standard deviation to test

% Define the Laplacian mask
laplacian_mask = [-1/8 -1/8 -1/8; -1/8 1 -1/8; -1/8 -1/8 -1/8];

% Initialize variables to store best results
min_distance = inf;
best_std_small = 0;
best_std_large = 0;

% Generate the LoG mask by convolving a Gaussian with the Laplacian mask
filter_size = ceil(6 * std_dev_log); % Ensure the mask is large enough
x = -filter_size:filter_size;
[X, Y] = meshgrid(x, x);
gaussian_log = exp(-(X.^2 + Y.^2) / (2 * std_dev_log^2)) / (2 * pi * std_dev_log^2);
log = conv2(gaussian_log, laplacian_mask, 'same'); % Apply convolution
log = log / max(log(:)); % Normalize the LoG mask to have max

% Loop through possible standard deviation values for DoG mask
for std_small = min_std:step_size:max_std
    for std_large = std_small + step_size:step_size:max_std % Ensure std_large > std_small
        
        % Generate the DoG mask by subtracting two Gaussians
        gaussian_small = exp(-(X.^2 + Y.^2) / (2 * std_small^2)) / (2 * pi * std_small^2);
        gaussian_large = exp(-(X.^2 + Y.^2) / (2 * std_large^2)) / (2 * pi * std_large^2);
        dog = gaussian_large - gaussian_small;
        dog = dog / max(dog(:)); % Normalize the DoG mask to have max amplitude of 1

        % Calculate Euclidean distance between the DoG and LoG masks
        distance = sqrt(sum((dog(:) - log(:)).^2));

        % Update best standard deviations if the current distance is smaller
        if distance < min_distance
            min_distance = distance;
            best_std_small = std_small;
            best_std_large = std_large;
        end
    end
end


fprintf('Best smaller standard deviation: %.2f\n', best_std_small);
fprintf('Best larger standard deviation: %.2f\n', best_std_large);


% % Step 1: Define the parameters and initialize variables
% sigma1_min = 0.1;  % Minimum value for smaller standard deviation (in steps of 0.10)
% sigma1_max = 6;    % Maximum value for smaller standard deviation
% sigma2_min = 0.1;  % Minimum value for larger standard deviation (in steps of 0.10)
% sigma2_max = 6;    % Maximum value for larger standard deviation
% step_size = 0.1;   % Step size for variation
% 
% % Define the Laplacian of Gaussian mask (LoG) with standard deviation of 5
% log_sigma = 5.0;   % Standard deviation for the Gaussian in LoG
% log_mask = fspecial('log', 15, log_sigma);  % LoG filter size is 15 to encompass the Gaussian spread
% 
% % Laplacian mask (constant part)
% laplacian_mask = [-1/8 -1/8 -1/8;
%                   -1/8   1  -1/8;
%                   -1/8 -1/8 -1/8];
% 
% % Convolve Gaussian with Laplacian mask to create the LoG filter
% log_mask = conv2(fspecial('gaussian', 15, log_sigma), laplacian_mask, 'same');
% 
% % Normalize the LoG mask
% log_mask = log_mask / max(abs(log_mask(:)));
% 
% % Step 2: Iterate through possible standard deviations for DoG mask
% best_distance = inf;  % Initialize the best distance as infinity
% best_sigma1 = 0;      % Initialize best smaller standard deviation
% best_sigma2 = 0;      % Initialize best larger standard deviation
% 
% for sigma1 = sigma1_min:step_size:sigma1_max
%     for sigma2 = sigma2_min:step_size:sigma2_max
%         % Create the DoG mask: Gaussian with sigma1 minus Gaussian with sigma2
%         dog_mask = fspecial('gaussian', 15, sigma2) - fspecial('gaussian', 15, sigma1);
%         
%         % Normalize the DoG mask
%         dog_mask = dog_mask / max(abs(dog_mask(:)));
% 
%         % Step 3: Compute the Euclidean distance between DoG and LoG masks
%         distance = sqrt(sum(sum((dog_mask - log_mask).^2)));
%         
%         % If this distance is the smallest so far, store the current sigma values
%         if distance < best_distance
%             best_distance = distance;
%             best_sigma1 = sigma1;
%             best_sigma2 = sigma2;
%         end
%     end
% end
% 
% % Output the results


