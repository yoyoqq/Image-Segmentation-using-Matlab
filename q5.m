I = imread('woods.png'); 

% Convert the image to double precision
Ia = im2double(I);

figure(11), clf
g=fspecial('gaussian',9,1.5);
IpyrG=Ia;
subplot(2,2,1),imagesc(IpyrG); axis('equal','tight'),colorbar
for i=2:3
   IpyrG=imresize(conv2(IpyrG,g,'same'), 0.5, 'nearest');
   subplot(2,2,i),imagesc(IpyrG); axis('equal','tight'), colorbar
end

IpyrG(1,11)
IpyrG(5, 8)