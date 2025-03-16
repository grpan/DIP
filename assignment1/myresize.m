function xrgbres = myresize (xrgb , N, M, method )
% myresize : Image subsampling
%   xrgbres = myresize (xrgb , N, M, method )

    %% Prepare to perform interpolation
    % Rename variables
    [Ni, Mi, ~] = size(xrgb);
    Ri = Ni;
    Ci = Mi;
    Ro = N;
    Co = M;
    
    % Compute Scale Factors
    Sr = Ri / Ro;
    Sc = Ci / Co;
    
    % Initialize xrgbres
    xrgbres = zeros(Ro,Co,3);

    
    if strcmp(method,'nearest')
        %% Nearest Neighbor
        
        % Subpixel indices:
        rf = ([1:Ro])*Sr - 0.5;
        cf = ([1:Co])*Sc - 0.5;

        % Get decimal part -- NN indices
        offset = 0;
        if Sr > 1
            r = floor(rf -offset);
        else
            r = ceil(rf -offset);
        end
            
        if Sc > 1
            c = floor(cf -offset);
        else
            c = ceil(cf -offset);
        end
        
        % Fix edge cases
        r(r < 1) = 1;
        c(c < 1) = 1;
        r(r > Ri) = Ri;
        c(c > Ci) = Ci;
        
        % Perform fast Nearest Neighbor interpolation
        xrgbres(1:Ro, 1:Co, :) = xrgb(r, c,:);
        
    elseif strcmp(method,'linear')
        %% Bilinear Interpolation
        
        % Subpixel Sample Locations
        rf = ([1:Ro]-0.5)*Sr+0.5;
        cf = ([1:Co]-0.5)*Sc+0.5;

        % Get their indices
        ro = floor(rf);
        co = floor(cf);
        
        % deltas - fractional parts
        dr = rf - ro;
        dc = cf - co;
        
        % Perform fast bilinear interpolation
        xrgbres(1:Ro, 1:Co, :) = xrgb(ro, co,:).*outerProduct((1-dr),(1-dc))...
            +xrgb(ro+1, co,:).*outerProduct(dr, 1-dc )...
            +xrgb(ro, co+1,:).*outerProduct(1-dr, dc)...
            +xrgb(ro+1, co+1,:).*outerProduct(dr, dc);
        
    else
        disp('Unkonwn interpolation method')
    end
        
    %filename = sprintf('~/Work/dip/ergasia1/work_erg1/%s.png', method)
    %imwrite(xrgbres, filename ,'png');

end
%% Helper for outer product
function result = outerProduct(p, q)
    [X,Y] = meshgrid(p,q);
    
    result = (X').*(Y');
end
