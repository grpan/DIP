function clusterIdx = mySpectralClustering(anAffinityMat , k)
% mySpectralClustering : Perform Spectral Clustering
%   clusterIdx = mySpectralClustering(anAffinityMat , k)

tmp = size(anAffinityMat);

dim = tmp(1);
D = zeros(dim,dim);


for i = 1:dim
    D(i,i) = sum(anAffinityMat(i,:));
end
L = D - anAffinityMat;

[Eig_vec,Eig_mat] = eigs(L,k,'smallestabs');
rng(1);
clusterIdx = kmeans(Eig_vec,k);

end