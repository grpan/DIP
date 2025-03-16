%%load x: march.mat
load('march.mat')

% prepare image
xrgb = bayer2rgb(x);

%% Perform Quantization/Deuantization
% quantization band widths
w1 = 1/2^3;
w2 = 1/2^3;
w3 = 1/2^3;

% quantize image
xrgb_q = imagequant (xrgb, w1 , w2 , w3);
% dequantize image
x_deq = imagedequant (xrgb_q, w1 , w2 , w3);

%% Plot
sgtitle('demo3: Quantization/Dequantization')
subplot(1,2,1)
plot(myquant([-1:0.001:1], 1/2^3))
grid on
title('Quantizer/Dequantizer')

subplot(1,2,2)
imshow(x_deq)
title('Bilinear Interpolation (200 x 300)')
