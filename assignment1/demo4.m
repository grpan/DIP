%%load x: march.mat
load('march.mat')

%% 1. Demosaic image to rgb
xrgb = bayer2rgb(x);


%% 2. Perform Bilinear Interpolation
N = 150;
M = 200;
N = 240;
M = 320;
method = 'linear';
xrgbres_b = myresize (xrgb , N, M, method );


%% 3. Perform Quantization
w1 = 1/2^3;
w2 = 1/2^3;
w3 = 1/2^3;

xrgb_q = imagequant (xrgbres_b, w1 , w2 , w3);
%% 4. Save as .ppm
ppm_name = 'dip_is_fun.ppm';


saveasppm (xrgb_q, ppm_name , 1/w1)

