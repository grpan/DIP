function x = mydequant (q, w)
% myquant : Dequantizer for mydequant
%   x = mydequant(q, w)
    
    %% Dequantize
    x = q*w + w/2;
    
end