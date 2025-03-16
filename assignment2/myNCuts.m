function clusterIdx = myNCuts(anAffinityMat ,k)
% myNCuts : main NCuts function
%   clusterIdx = myNCuts(anAffinityMat ,k)

tmp = size(anAffinityMat);
dim = tmp(1);
D = zeros(dim,dim);
for i = 1:dim
    D(i,i) = sum(anAffinityMat(i,:));
end
L = D - anAffinityMat;
[Eig_vec,Eig_mat] = eigs(L,D,k,'smallestabs');
rng(1);
clusterIdx = kmeans(Eig_vec,k);

end