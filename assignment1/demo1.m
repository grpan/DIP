%%load x: march.mat
load('march.mat')


%% Demosaic
xrgb = bayer2rgb(x);
imshow(xrgb)
title('demo1: Image Demosaic')


disp("Kernels used:")
kernel_rb = 1/4*[1 2 1; 2 4 2; 1 2 1]
kernel_g = 1/4*[1 2 1; 2 4 2; 1 2 1]
