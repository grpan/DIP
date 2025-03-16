%% Demo2
load('dip_hw_2.mat')

Aff_1 = Image2Graph(d2a);
Aff_2 = Image2Graph(d2b);

for i = 2:4
   res_1 = mySpectralClustering(Aff_1 , i);
   %% Make an image representation of the clusters
   im_rep1 = reshape(res_1,[50,50]);
   figure(i-1)
   imshow(im_rep1,[1 i+1])
   title(['k = ',num2str(i)])
   
   res_2 = mySpectralClustering(Aff_2 , i);
   im_rep2 = reshape(res_2,[50,50]);
   figure(i+2)
   imshow(im_rep2,[1 i+1])
   title(['k = ',num2str(i)])
   
end