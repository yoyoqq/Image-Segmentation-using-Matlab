img = imread('elephant.png');

% Convert the image to grayscale if it's not already
if size(img, 3) > 1
    img = rgb2gray(img);
end

% Convert the image to double for processing
img = im2double(img);

% Define the Gabor mask parameters
sigma = 3;         % Standard deviation of the Gaussian envelope
lambda = 0.1;      % Wavelength of the sinusoidal factor
gamma = 0.75;      % Spatial aspect ratio

orientations = [0,15,30,45,60,75,90,105,120,135,150,165];

% % Generate the two Gabor masks (quadrature pair)
% gaborMask_90 = gabor2(sigma, lambda, theta, gamma, 90); % Phase 90 degrees
% gaborMask_0 = gabor2(sigma, lambda, theta, gamma, 0);   % Phase 0 degrees
% 
% % Apply the Gabor masks to the image
% output_90 = conv2(img, gaborMask_90, 'valid');
% output_0 = conv2(img, gaborMask_0, 'valid');
% 
% % Combine the two outputs using L2-norm
% combined_output = sqrt(output_90.^2 + output_0.^2);
% 
% % Display the result
% figure;
% imshow(combined_output, []);
% title('Phase-Invariant Response of V1 Complex Cells');

max_response = zeros(484);
% Loop over each orientation
for theta = orientations
    % Generate the two Gabor masks (quadrature pair) using the provided gabor2 function
    gaborMask_90 = gabor2(sigma, lambda, theta, gamma, 90);  % Phase 90 degrees
    gaborMask_0 = gabor2(sigma, lambda, theta, gamma, 0);    % Phase 0 degrees

    % Perform convolution
    output_90 = conv2(img, gaborMask_90, 'valid');
    output_0 = conv2(img, gaborMask_0, 'valid');

    % Calculate the complex response
    complex_response = sqrt(output_90.^2 + output_0.^2);

    % If max_response is empty, initialize it with the size of complex_response
    %if isempty(max_response)
   %     max_response = complex_response;
   % else
        % Update the maximum response at each pixel location
        max_response = max(max_response, complex_response);
  %  end
end

% Display the result
figure;
imshow(max_response, []);
colorbar;
title('Orientation-Invariant Edge Detection using Complex Cells');


% img = imread('elephant.png');
% 
% % Convert the image to grayscale if it's not already
% if size(img, 3) > 1
%     img = rgb2gray(img);
% end
% 
% % Convert the image to double for processing
% img = double(img);
% 
% % Define the Gabor mask parameters
% sigma = 3;         % Standard deviation of the Gaussian envelope
% lambda = 0.1;      % Wavelength of the sinusoidal factor
% gamma = 0.75;      % Spatial aspect ratio
% 
% orientations = [0,15,30,45,60,75,90,105,120,135,150,165];
% 
% % % Generate the two Gabor masks (quadrature pair)
% % gaborMask_90 = gabor2(sigma, lambda, theta, gamma, 90); % Phase 90 degrees
% % gaborMask_0 = gabor2(sigma, lambda, theta, gamma, 0);   % Phase 0 degrees
% % 
% % % Apply the Gabor masks to img = imread('elephant.png');

% Convert the image to grayscale if it's not already
if size(img, 3) > 1
    img = rgb2gray(img);
end

% Convert the image to double for processing
img = double(img);

% Define the Gabor mask parameters
sigma = 3;         % Standard deviation of the Gaussian envelope
lambda = 0.1;      % Wavelength of the sinusoidal factor
gamma = 0.75;      % Spatial aspect ratio

orientations = [0,15,30,45,60,75,90,105,120,135,150,165];


max_response = zeros(484);
% Loop over each orientation
for theta = orientations
    % Generate the two Gabor masks (quadrature pair) using the provided gabor2 function
    gaborMask_90 = gabor2(sigma, lambda, theta, gamma, 90);  % Phase 90 degrees
    gaborMask_0 = gabor2(sigma, lambda, theta, gamma, 0);    % Phase 0 degrees

    % Perform convolution
    output_90 = conv2(img, gaborMask_90, 'valid');
    output_0 = conv2(img, gaborMask_0, 'valid');

    % Calculate the complex response
    complex_response = sqrt(output_90.^2 + output_0.^2);

        max_response = max(max_response, complex_response);
  %  end
end

max_response(281, 256)
max_response(23,3)

% Display the result

% % output_90 = conv2(img, gaborMask_90, 'valid');
% % output_0 = conv2(img, gaborMask_0, 'valid');
% % 
% % % Combine the two outputs using L2-norm
% % combined_output = sqrt(output_90.^2 + output_0.^2);
% % 
% % % Display the result
% % figure;
% % imshow(combined_output, []);
% % title('Phase-Invariant Response of V1 Complex Cells');
% 
% 
% % Loop over each orientation
% for theta = orientations
%     % Generate the two Gabor masks (quadrature pair) using the provided gabor2 function
%     gaborMask_90 = gabor2(sigma, lambda, theta, gamma, 90);  % Phase 90 degrees
%     gaborMask_0 = gabor2(sigma, lambda, theta, gamma, 0);    % Phase 0 degrees
% 
%     % Perform convolution
%     output_90 = conv2(img, gaborMask_90, 'valid');
%     output_0 = conv2(img, gaborMask_0, 'valid');
% 
%     % Calculate the complex response
%     complex_response = sqrt(output_90.^2 + output_0.^2);
% 
%     % If max_response is empty, initialize it with the size of complex_response
%     if isempty(max_response)
%         max_response = complex_response;
%     else
%         % Update the maximum response at each pixel location
%         max_response = max(max_response, complex_response);
%     end
% end
% 
% % Display the result
% figure;
% imshow(max_response, []);
% title('Orientation-Invariant Edge Detection using Complex Cells');
% 



% I = imread('elephant.png');  % Adjust the file path if necessary
% 
% 
% % Convert the image to double precision
% I = im2double(I);
% 
% gA=gabor2(3,0.1,90,0.75,90);
% gB=gabor2(3,0.1,90,0.75,0);
% IgA=conv2(I,gA,'valid');
% IgB=conv2(I,gB,'valid');
% Ic=sqrt((IgA.^2)+(IgB.^2));
% figure(2), clf, imagesc(Ic); axis('equal','tight'), colormap('gray'); colorbar
% 
% 
% % Read the image and convert it to double precision
% I = imread('elephant.png');  % Adjust the file path if necessary
% I = im2double(I);  % Convert to double for processing
% 
% % Define the parameters for the Gabor filters
% wavelength = 3;  % Wavelength of the sinusoidal factor
% sigma = 0.1;  % Standard deviation of the Gaussian envelope
% gamma = 0.75;  % Spatial aspect ratio
% psi = 0;  % Phase shift
% 
% % Define the orientations (0°, 15°, ..., 165°)
% orientations = 0:15:165;
% 
% % Initialize the matrix to store the maximum response
% Ic = zeros(size(I));
% 
% % Loop through each orientation and apply the Gabor filter
% for i = 1:length(orientations)
% theta = orientations(i);  % Current orientation
% 
% % Create Gabor filter for this orientation (using gabor2 or custom function)
% gabor = gabor2(wavelength, sigma, theta, gamma, psi);
% 
% % Convolve the image with the Gabor filter
% Ig = conv2(I, gabor, 'same');
% 
% % Update the maximum response at each pixel (combine responses)
% Ic = max(Ic, Ig);  % Take the maximum across orientations at each pixel
% end
% 
% % Display the result
% figure(2), clf;
% imagesc(Ic);  % Show the maximum response of complex cells
% axis('equal', 'tight');
% colormap('gray');
% colorbar;
% title('Maximum Response of Complex Cells at Multiple Orientations');
% 
% Ic(281, 256)
% Ic(23, 3)