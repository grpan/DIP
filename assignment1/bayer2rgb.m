function xrgb = bayer2rgb(xb)
% bayer2rgb: Demosaic a bayer-filtered image to rgb.
%   xrgb = bayer2rgb(xb)

    disp("bayer2rgb function")
    
    [x_rows, x_cols] = size(xb);

%% Start matrix pre-processing
    function sm = submatrix(m, start_row, start_col)
    % submatrix: Helper to split image to 3 color matrices
    % with zeros
        mask = false(x_rows, x_cols);
        mask(start_row:2:end, start_col:2:end) = true;
        sm = m;
        sm(~mask) = 0;
        %sm = padarray(sm, [2, 2], 0);
    end
        
    sm_r = submatrix(xb, 2, 1);
    sm_b = submatrix(xb, 1, 2);
    sm_g = submatrix(xb, 1, 1) + submatrix(xb, 2, 2);
        
%% Perform the concolutions
    
    kernel_rb = [1 2 1; 2 4 2; 1 2 1];
    kernel_g = [0 1 0; 1 4 1; 0 1 0];
    
    sm_r = conv2(sm_r, 1/4*kernel_rb, 'same');
    sm_b = conv2(sm_b, 1/4*kernel_rb, 'same');
    sm_g = conv2(sm_g, 1/4*kernel_g, 'same');
    
    % fix borders
    %1ST ROW
    sm_r(1,:) = sm_r(1,:)*2;
    sm_g(1,2:2:end) = sm_g(1,2:2:end) * (4/3);
    %LAST ROW
    sm_b(end,:) = sm_b(end,:)*2;
    sm_g(end,1:2:end) = sm_g(end,1:2:end) * (4/3);
    %1ST COL
    sm_b(:,1) = sm_b(:,1)*2;
    sm_g(2:2:end,1) = sm_g(2:2:end,1) * (4 / 3);
    %LAST COL
    sm_r(:,end) = sm_r(:,end)*2;
    sm_g(1:2:end,end) = sm_g(1:2:end,end) * (4 / 3);
    
    xrgb = cat(3,sm_r,sm_g,sm_b);
end