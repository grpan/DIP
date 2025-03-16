%% Demo3c
load('dip_hw_2.mat')

Aff_1 = Image2Graph(d2a);
Aff_2 = Image2Graph(d2b);

T1 = 5;

T2 = 0.2;


%% Image d2a
res1 = NCutsRecursive(Aff_1 ,T1,T2);
clear NCutsRecursive
im_rep1 = reshape(res1,[50,50]);
clt = unique(res1);
bottom = min(clt);
top = max(clt);
tmp = size(clt);
length_clt = tmp(1);
figure(1)
imshow(im_rep1,[bottom top+1])
title(['Image d2a for k= ',num2str(length_clt)])

%% Image d2b
res2 = NCutsRecursive(Aff_2 ,T1,T2);
clear NCutsRecursive
im_rep2 = reshape(res2,[50,50]);
clt = unique(res2);
bottom = min(clt);
top = max(clt);
tmp = size(clt);
length_clt = tmp(1);
figure(2)
imshow(im_rep2,[bottom top+1])
title(['Image d2b for k= ',num2str(length_clt)])

