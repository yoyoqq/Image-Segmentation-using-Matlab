
% Load the rooster image
I = imread('rooster.jpg');  % Adjust the file path if necessary

% Convert the image to double precision
Iad = im2double(I);


gc=fspecial('gaussian',16,2.85);         % why 16 or 9
gs=fspecial('gaussian',16,2.85);


Y=mean(Iad(:,:,1:2),3);



IaYB=conv2(Y,gc,'same')-conv2(Iad(:,:,3),gs,'same');
subplot(2,2,4); imagesc(IaYB); axis('off','equal','tight'); colorbar, title('yellow-on, blue-off')

IaYB(178, 15)
IaYB(145, 293)


