function q = myquant (x, w)
% myquant : Uniform quantizer
%   q = myquant(x, w)

    %% Use floor to quantize
    q = floor(x/w);

end