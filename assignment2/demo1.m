%% Demo1
load('dip_hw_2.mat')

res = zeros(12,3);
for i = 2:4
     res(:,i-1) = mySpectralClustering(d1a , i);
     %% Make an image representation of the clusters
     imame_repr = reshape(res(:,i-1),[4,3]);
     figure(i)
     imshow(imame_repr,[1 i+1])
     title(['k = ',num2str(i)])
end
