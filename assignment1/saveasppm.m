function saveasppm (x, filename , K)
% saveasppm : Save image in PPM format. (Portable Pixel Map)
%   saveasppm (x, filename , K)

    %% Prepare parameters (Header, Image path)
    location = '~/Work/dip/ergasia1/work_erg1/%s';
    filepath = sprintf(location, filename);
    
    header = sprintf('P6 %d %d %d\n', size(x,2), size(x,1), K);

    disp(class(x(1)))
    
    %% Prepare the image for saving
    c1 = x(:, :, 1)';
    c2 = x(:, :, 2)';
    c3 = x(:, :, 3)';

    c = [c1(:) c2(:) c3(:)];
    c = c';
    
    %% Start saving the image
    fid=fopen(filepath,'w');
    
    fprintf(fid, header);
    
    fwrite(fid,c,'uint8');

    fclose(fid);
    
end