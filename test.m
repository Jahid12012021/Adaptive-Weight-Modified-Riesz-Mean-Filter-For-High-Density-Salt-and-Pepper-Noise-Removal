clc;
clear;
close all;
% Read the original image
picture = imread(image_path);

% Check if the image is grayscale (2D)
if ndims(picture) == 2
    disp('The image is already 2D (grayscale).');
else
    % Convert the image to grayscale (2D)
    picture = rgb2gray(picture);
    disp('The image has been converted to 2D (grayscale).');
end

% Initialize arrays to store PSNR and SSIM values for all filters
psnr_values_AFMF = zeros(1, 8);
psnr_values_AWMF = zeros(1, 8);
psnr_values_IAWMF = zeros(1, 8);
psnr_values_ARmF = zeros(1, 8);
psnr_values_ACmF = zeros(1, 8);
psnr_values_DAMRmF = zeros(1, 8);
psnr_values_AWMRmF = zeros(1, 8);

ssim_values_AFMF = zeros(1, 8);
ssim_values_AWMF = zeros(1, 8);
ssim_values_IAWMF = zeros(1, 8);
ssim_values_ARmF = zeros(1, 8);
ssim_values_ACmF = zeros(1, 8);
ssim_values_DAMRmF = zeros(1, 8);
ssim_values_AWMRmF = zeros(1, 8);

% Initialize arrays to store execution times for all filters
execution_time_AFMF = zeros(1, 8);
execution_time_AWMF = zeros(1, 8);
execution_time_IAWMF = zeros(1, 8);
execution_time_ARmF = zeros(1, 8);
execution_time_ACmF = zeros(1, 8);
execution_time_DAMRmF = zeros(1, 8);
execution_time_AWMRmF = zeros(1, 8);



% Generate noise levels from 0.1 to 0.8
noise_levels = linspace(0.6, 0.95, 8);

for i = 1:length(noise_levels)
    % Add salt and pepper noise to the original image
    Noise_Image = imnoise(picture, 'salt & pepper', noise_levels(i));

    % Measure execution time for AFMF
    tic;
    Denoised_Image_AFMF = AFMF(Noise_Image);
    execution_time_AFMF(i) = toc;
    % Measure execution time for AWMF
    tic;
    Denoised_Image_AWMF = AWMF(Noise_Image);
    execution_time_AWMF(i) = toc;
    % Measure execution time for IAWMF
    tic;
    Denoised_Image_IAWMF = IAWMF(Noise_Image);
    execution_time_IAWMF(i) = toc;
    % Measure execution time for ARmF
    tic;
    Denoised_Image_ARmF = ARmF(Noise_Image);
    execution_time_ARmF(i) = toc;
    % Measure execution time for ACmF
    tic;
    Denoised_Image_ACmF = ACmF(Noise_Image);
    execution_time_ACmF(i) = toc;
    % Measure execution time for DAMRmF
    tic;
    Denoised_Image_DAMRmF = DAMRmF(Noise_Image);
    execution_time_DAMRmF(i) = toc;
    % Measure execution time for AMRmF
    tic;
    Denoised_Image_AMRmF = AMRmF(Noise_Image);
    execution_time_AWMRmF(i) = toc;
   
    
 
    % Compute PSNR values for each denoised image
    psnr_values_AFMF(i) = psnr(picture, Denoised_Image_AFMF);
    psnr_values_AWMF(i) = psnr((picture), uint8(Denoised_Image_AWMF));
    psnr_values_IAWMF(i) = psnr((picture), uint8(Denoised_Image_IAWMF));
    psnr_values_ARmF(i) = psnr(picture, Denoised_Image_ARmF);
    psnr_values_ACmF(i) = psnr(picture, Denoised_Image_ACmF);
    psnr_values_DAMRmF(i) = psnr(picture, Denoised_Image_DAMRmF);
    psnr_values_AWMRmF(i) = psnr(picture, Denoised_Image_AMRmF);
    
    % Compute SSIM values for each denoised image
    ssim_values_AFMF(i) = ssim(picture, Denoised_Image_AFMF);
    ssim_values_AWMF(i) = ssim((picture), uint8(Denoised_Image_AWMF));
    ssim_values_IAWMF(i) = ssim((picture), uint8(Denoised_Image_IAWMF));
    ssim_values_ARmF(i) = ssim(picture, Denoised_Image_ARmF);
    ssim_values_ACmF(i) = ssim(picture, Denoised_Image_ACmF);
    ssim_values_DAMRmF(i) = ssim(picture, Denoised_Image_DAMRmF);
    ssim_values_AWMRmF(i) = ssim(picture, Denoised_Image_AMRmF);
end

%Display Running Time
disp(['execution_time_AFMF: ', num2str(execution_time_AFMF)]);
disp(['execution_time_AWMF: ', num2str(execution_time_AWMF)]);
disp(['execution_time_ACmF: ', num2str(execution_time_ACmF)]);
disp(['execution_time_ARmF: ', num2str(execution_time_ARmF)]);
disp(['execution_time_IAWMF: ', num2str(execution_time_IAWMF)]);
disp(['execution_time_DAMRmF: ', num2str(execution_time_DAMRmF)]);
disp(['execution_time_AWMRmF: ', num2str(execution_time_AWMRmF)]);

% Display PSNR
disp(['psnr_values_AFMF: ', num2str(psnr_values_AFMF)]);
disp(['psnr_values_AWMF: ', num2str(psnr_values_AWMF)]);
disp(['psnr_values_ACmF: ', num2str(psnr_values_ACmF)]);
disp(['psnr_values_ARmF: ', num2str(psnr_values_ARmF)]);
disp(['psnr_values_IAWMF: ', num2str(psnr_values_IAWMF)]);
disp(['psnr_values_DAMRmF: ', num2str(psnr_values_DAMRmF)]);
disp(['psnr_values_AWMRmF: ', num2str(psnr_values_AWMRmF)]);

%Mean ofPSNR
% disp(['psnr_values_AFMF: ', num2str(mean(psnr_values_AFMF))]);
% disp(['psnr_values_AWMF: ', num2str(mean(psnr_values_AWMF))]);
% disp(['psnr_values_ACmF: ', num2str(mean(psnr_values_ACmF))]);
% disp(['psnr_values_ARmF: ', num2str(mean(psnr_values_ARmF))]);
% disp(['psnr_values_IAWMF: ', num2str(mean(psnr_values_IAWMF))]);
% disp(['psnr_values_DAMRmF: ', num2str(mean(psnr_values_DAMRmF))]);
% disp(['psnr_values_AWMRmF: ', num2str(mean(psnr_values_AWMRmF))]);

% Display SSIM
disp(['ssim_values_AFMF: ', num2str(ssim_values_AFMF)]);
disp(['ssim_values_AWMF: ', num2str(ssim_values_AWMF)]);
disp(['ssim_values_ACmF: ', num2str(ssim_values_ACmF)]);
disp(['ssim_values_ARmF: ', num2str(ssim_values_ARmF)]);
disp(['ssim_values_IAWMF: ', num2str(ssim_values_IAWMF)]);
disp(['ssim_values_DAMRmF: ', num2str(ssim_values_DAMRmF)]);
disp(['ssim_values_AWMRmF: ', num2str(ssim_values_AWMRmF)]);

% %mean of SSIM
% disp(['ssim_values_AFMF: ', num2str(mean(ssim_values_AFMF))]);
% disp(['ssim_values_AWMF: ', num2str(mean(ssim_values_AWMF))]);
% disp(['ssim_values_ACmF: ', num2str(mean(ssim_values_ACmF))]);
% disp(['ssim_values_ARmF: ', num2str(mean(ssim_values_ARmF))]);
% disp(['ssim_values_IAWMF: ', num2str(mean(ssim_values_IAWMF))]);
% disp(['ssim_values_DAMRmF: ', num2str(mean(ssim_values_DAMRmF))]);
% disp(['ssim_values_AWMRmF: ', num2str(mean(ssim_values_AWMRmF))]);
