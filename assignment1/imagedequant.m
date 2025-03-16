function x = imagedequant (q, w1 , w2 , w3)
% imagedequant : Deuantize image
%   x = imagedequant (q, w1 , w2 , w3)

    %% Slice image to respective channel, dequantize one by one.
    x1 = mydequant(q(:,:,1), w1);
    x2 = mydequant(q(:,:,2), w2);
    x3 = mydequant(q(:,:,3), w3);
    
    %% Concatenate and return
    x= cat(3,x1,x2,x3);
end