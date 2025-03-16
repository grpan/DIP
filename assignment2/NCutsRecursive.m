function clusterIdx = NCutsRecursive(anAffinityMat,T1,T2)
% calculateNcut : NCutsRecursive Ncut recursive
%   nCutValue = NCutsRecursive(anAffinityMat , clusterIdx)
persistent L
persistent R

if (isempty(R) || isempty(L))
    L = -1;
    R = 0;    
end

L = L + 2;
R = R + 2;



res = myNCuts(anAffinityMat ,2); %index column vector
Ncut = calculateNcut(anAffinityMat , res);

tag_a = find(res == 1); %tag_a -> cluster '1'
tmp1 = size(tag_a);
lenght_a = tmp1(1);

tag_b = find(res == 2); %tag_a -> cluster '2'
tmp1 = size(tag_b);
len_b = tmp1(1);


if ( lenght_a > T1 && len_b > T1 && Ncut < T2 )
    
    W_n1 = zeros(lenght_a,lenght_a);

    for i = 1:lenght_a
        for j = 1:lenght_a

            m = tag_a(i);
            n = tag_a(j);
            W_n1(i,j) = anAffinityMat(m,n);
        end
    end
        
    %% cluster '1'
    res1 = NCutsRecursive(W_n1, T1, T2);
    clust = unique(res1);

    if (clust(1,1) == 1 && clust(2,1) == 2)
        tag_1a = find(res1 == 1);
        res1(tag_1a) = L;
        tag_1b = find(res1 == 2);
        res1(tag_1b) = R;
    
        tmp1 = size(tag_1a);
        lenght_1a = tmp1(1);
        tmp1 = size(tag_1b);
        length_1b = tmp1(1);

        if ( lenght_1a < T1 || length_1b < T1 )
            res1(:) = R;
        end
    end
    
    W_n2 = zeros(len_b,len_b);
    %Create Affinity Sub-Matrix of cluster '2'
    for i = 1:len_b
        for j = 1:len_b
        %I take the edges connecting nodes of cluster 2
        %and put them in a new Affinity Matrix
            m = tag_b(i);
            n = tag_b(j);
            W_n2(i,j) = anAffinityMat(m,n);
        end
    end
    %% cluster '2'
    res2 = NCutsRecursive(W_n2, T1, T2);
    clust = unique(res2);

    if (clust(1,1) == 1 && clust(2,1) == 2)
        tag_1a = find(res2 == 1);
        res2(tag_1a) = L;
        tag_1b = find(res2 == 2);
        res2(tag_1b) = R;
    
        tmp1 = size(tag_1a);
        lenght_1a = tmp1(1);
        tmp1 = size(tag_1b);
        length_1b = tmp1(1);

        if ( lenght_1a < T1 || length_1b < T1 )
            res2(:) = L;
        end
    end

    %reconstruction of the ids into a single one
    res(tag_a,1) = res1;
    res(tag_b,1) = res2;    
end

clusterIdx = res;

end