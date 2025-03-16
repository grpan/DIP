function q = imagequant (x, w1 , w2 , w3)
% imagequant : Quantize image
%   q = imagequant (x, w1 , w2 , w3)

    %% Slice image to respective channel, quantize one by one.
    q1 = myquant(x(:,:,1), w1);
    q2 = myquant(x(:,:,2), w2);
    q3 = myquant(x(:,:,3), w3);

    %% Concatenate and return
    q= cat(3,q1,q2,q3);
    
end