function [seg] = segment_image(I)
    % Convert the image to double precision (if not already)
    I = im2double(I);

    % Step 1: Convert the image from RGB to Lab color space
    I_lab = rgb2lab(I);
    
    % Step 2: Apply edge detection using the Canny edge detector on the grayscale version
    edges = edge(rgb2gray(I), 'Canny');
    
    % Step 3: Apply k-means clustering to segment the image based on color (Lab color space)
    % Reshape the image into a 2D array of pixels for clustering
    reshaped_image = reshape(I_lab, [], 3);  % 3 columns for the 3 color channels (L, a, b)
    
    % Define the number of clusters (regions in the segmentation)
    num_clusters = 5;  % You can adjust this number for different results
    
    % Perform k-means clustering to assign each pixel to a cluster
    [labels, ~] = kmeans(reshaped_image, num_clusters);
    
    % Step 4: Reshape the labels back to the size of the original image
    seg = reshape(labels, size(I, 1), size(I, 2));  % Reshape the 1D labels back to the image size
    
    % Step 5: Apply post-processing (optional)
    % Perform morphological opening to smooth the boundaries of the segmented regions
    seg = imopen(seg, strel('disk', 5));  % Clean up segmentation with a disk-shaped structuring element
    
    % Optional: If you need to display the segmented image, uncomment the following:
    % figure, imshow(label2rgb(seg)); % Display the segmented image with color labels
end
