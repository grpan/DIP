function myGFilter = my2DGaussianFilter (K, sigma )
% myquant : Uniform quantizer
%   myGFilter = my2DGaussianFilter (K, sigma )

    %% mesh coordinates
    idx = -(K-1)/2:(K-1)/2;
    [x, y] = meshgrid(idx, idx );
    
    %% filter calculation
    GF = exp( -(x.^2+y.^2) / (2 * sigma ^ 2) );
    myGFilter = GF ./ sum(GF(:));
    
    %GF= (1 / (2 * pi * sigma^2)) * exp(-(x.^2+y.^2) / (2 * sigma^2));
    %myGFilter = (1 / (2 * pi * sigma^2)) * exp(-(x.^2+y.^2) / (2 * sigma^2));
    

end
