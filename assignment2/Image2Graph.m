    function myAffinityMat = Image2Graph(imIn)

temp = size(imIn);
dim = size(temp);
rows = temp(1);
cols = temp(2);
if (dim(1,2) == 3)
    n = temp(3);
end

dim_A = rows * cols;
A = zeros(dim_A,dim_A);

if (dim(1,2) == 2)
%% Grayscale    
    Im = reshape(imIn,1,[]);
    for i = 1:dim_A
        for j = 1:dim_A
            d = abs(Im(i)-Im(j));
            A(i,j) = 1/exp(d);              
        end
    end    
else
%% Multi-channel
    r_mats = zeros(n,dim_A);
    for i = 1:n
        %Make colour matrices line vectors
        r_mats(i,:) = reshape(imIn(:,:,i),1,[]);
    end
    
    for i = 1:dim_A
        for j = 1:dim_A
            sum = 0;
%The third for-loop handles images with k channels, not just RGB
            for k = 1:n
                sum = sum + (r_mats(k,i) - r_mats(k,j))^2;
            end
            d = sqrt(sum);
            A(i,j) = 1/exp(d);
        end
    end    
end

myAffinityMat = A;

end
