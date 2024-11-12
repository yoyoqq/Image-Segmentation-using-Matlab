% Load the image
I = imread('woods.png');

% Convert image to double precision
I = im2double(I);

% Define the DoG filter
dog = fspecial('gaussian', 11, 2.5) - fspecial('gaussian', 11, 1);

% Convolve the image with the DoG filter
Idog = conv2(I, dog, 'same');

% Display the DoG processed image
figure, clf, imagesc(Idog);
colormap('gray');
colorbar;
title('DoG Processed Image');

% Calculate correlation coefficients
offsets = 0:30;
simb = zeros(size(offsets));
simc = zeros(size(offsets));

for offset = offsets
   simb(offset+1) = corr2(I(1:end-offset,:), I(1+offset:end,:));
   simc(offset+1) = corr2(Idog(1:end-offset,:), Idog(1+offset:end,:));
end

% Plot the correlation coefficients
figure(8), clf;
plot(offsets, simb, '-o');
hold on;
plot(offsets, simc, '-x');
legend({'Original Image', 'DoG Processed Image'});
xlabel('Vertical Shift (pixels)');
ylabel('Correlation Coefficient');
title('Correlation vs. Vertical Shift');
hold off;


correlationCoefficient = corr2(double(Idog), double(I));


% I = imread('woods.png')
% 
% I = im2double(I);
% 
% % Get the size of the image
% % img_size = size(I);
% 
% % Display the size
% % disp('Image size:');
% % disp(img_size);
% 
% % with 170, 15 or 25 is good 
% dog=fspecial('gaussian',11,2.5)-fspecial('gaussian',11,1);
% 
% 
% Idog=conv2(I,dog,'same');
% 
% figure, clf, imagesc(Idog); colormap('gray'); colorbar
% 
% 
% Idog(3, 110)
% 
% 
% offsets=[0:30];
% for offset=offsets
%    simb(offset+1)=corr2(I(1:end-offset,:),I(1+offset:end,:));
%    simc(offset+1)=corr2(Idog(1:end-offset,:),Idog(1+offset:end,:));
% end
% figure(8), clf,
% plot(offsets,simb);
% hold on;
% plot(offsets,simc);
% legend({'elephant','woods'});
% xlabel('shift'); ylabel('correlation coefficient')




% ---------------------------------------------------------------
% % Initialize an array to store correlation coefficients for shifts 0 to 30
% offsets = 0:30;  % Define the range of vertical shifts (0 to 30 pixels)
% correlations = zeros(length(offsets), 1);  % Store correlation values
% 
% % Loop through each vertical shift
% for offset = offsets
%     % Create a vertically shifted version of the DoG-filtered image
%     shifted_Idog = circshift(Idog, [offset, 0]);
%     
%     % Calculate the correlation coefficient between the original and shifted image
%     correlations(offset + 1) = corr2(Idog, shifted_Idog);
% end
% 
% % Plot the correlation coefficient vs vertical shift
% figure;
% plot(offsets, correlations, '-o', 'LineWidth', 2);
% xlabel('Vertical Shift (pixels)');
% ylabel('Correlation Coefficient');
% title('Correlation Coefficient vs Vertical Shift for DoG Convolved Image');
% grid on;
% 
% 
% % Report the correlation coefficient for 5-pixel shift (index 6 corresponds to shift 5)
% corr_5 = correlations(6);  % 5-pixel shift corresponds to the 6th element
% disp(['Correlation coefficient at 5-pixel shift: ', num2str(corr_5, '%.2f')]);
% 
% % Report the correlation coefficient for 20-pixel shift (index 21 corresponds to shift 20)
% corr_20 = correlations(21);  % 20-pixel shift corresponds to the 21st element
% disp(['Correlation coefficient at 20-pixel shift: ', num2str(corr_20, '%.2f')]);

