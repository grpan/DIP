function nCutValue = calculateNcut(anAffinityMat , clusterIdx)
% calculateNcut : Calculate Ncut measure
%   nCutValue = calculateNcut(anAffinityMat , clusterIdx)

temp = size(anAffinityMat);
dim = temp(1);

assoc_aa = 0;
assoc_bb = 0;
assoc_av = 0;
assoc_bv = 0;

for i = 1:dim
    if clusterIdx(i) == 1
        assoc_av = assoc_av + sum(anAffinityMat(i,:));
    else
        assoc_bv = assoc_bv + sum(anAffinityMat(i,:));
    end
    for j = 1:dim
        if ( clusterIdx(i) == 1 && clusterIdx(j) == 1 )
            assoc_aa = assoc_aa + anAffinityMat(i,j);
        end
        if ( clusterIdx(i) == 2 && clusterIdx(j) == 2 )
            assoc_bb = assoc_bb + anAffinityMat(i,j);
        end        
    end
end

Nassoc = assoc_aa/assoc_av + assoc_bb/assoc_bv;
nCutValue = 2 - Nassoc;

end