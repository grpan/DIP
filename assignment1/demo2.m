%%load x: march.mat
load('march.mat')

xrgb = bayer2rgb(x);

xb = x;

N = 240;
M = 320;
method = 'nearest';
xrgbres_nn = myresize (xrgb , N, M, method );
%imshow(xrgbres_nn)


N = 200;
M = 300;
method = 'linear';
xrgbres_b = myresize (xrgb , N, M, method );
%imshow(xrgbres_b)


sgtitle('demo2: Resampling')

subplot(1,2,1)
imshow(xrgbres_nn)
title('Nearest Neighbor (240 x 320)')

subplot(1,2,2)
imshow(xrgbres_b)
title('Bilinear Interpolation (200 x 300)')
