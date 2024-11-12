
I = imread('woods.png');  % Adjust the file path if necessary

% Convert the image to double precision
I = im2double(I);

% Create the 2D Gaussian masks
gaussian_small = fspecial('gaussian', 7, 1.5); 
gaussian_large = fspecial('gaussian', 15, 5);  

laplacian=[-0.125,-0.125,-0.125;-0.125,1,-0.125;-0.125,-0.125,-0.125];

% Convolve the Laplacian mask with the Gaussian masks to get LoG
LoG_small = conv2(gaussian_small, laplacian, 'same');
LoG_large = conv2(gaussian_large, laplacian, 'same');

% Convolve the woods image with the LoG masks
I_LoG_small = conv2(I, LoG_small, 'same');
I_LoG_large = conv2(I, LoG_large, 'same');

I_LoG_small(155, 165)
I_LoG_small(155, 69)

I_LoG_large(155, 165)
I_LoG_large(156, 69)