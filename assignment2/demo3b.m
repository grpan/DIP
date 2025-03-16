%% Demo3b
load('dip_hw_2.mat')

Aff_1 = Image2Graph(d2a);
Aff_2 = Image2Graph(d2b);


T1 = 0;
T2 = 0;
res1 = NCutsRecursive(Aff_1 ,T1,T2);
clear NCutsRec

im_rep1 = reshape(res1,[50,50]);
figure(1)
imshow(im_rep1,[1 3])
title('Image d2a')

res2 = NCutsRecursive(Aff_2 ,T1,T2);
clear NCutsRec

im_rep2 = reshape(res2,[50,50]);
figure(2)
imshow(im_rep2,[1 3])
title('Image d2b')