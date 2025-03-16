function [ spacescales , DoGs] = myDoGs (img , K, sigma , levels , octaves )

    %K, sigma , levels , octaves
    k = sqrt(2);

    spacescales = cell(1,octaves);
    DoGs = cell(1,octaves);
    
    img_new = img;
    %% Iterate over octaves
    for j = 1:octaves
        
        %imresize(img,0.5);
        
        % prefer to use third L.
        %img_new = imresize(img,2^-(j-1));
        
        
        sigma_oct = sigma*2^(j-1);
        
        Level = [];
        DoG = [];
        
        
        %sigmas = ((k*ones(1,levels)) .^ [0:1:(levels-1)] ) * sigma_oct;
        
        %L = conv2(img_new, filter,'same');
        
        %% Iterate over Levels.
        for i = 1:levels
            %L = [];
            sigmanew = sigma_oct * (k) ^ (i-1);
            
            %fprintf('Octave: %d, Level: %d sigmanew: %.2f\n', j, i, sigmanew)
            
            filter = my2DGaussianFilter(K, sigmanew );
            
            L = conv2(img_new, filter,'same');
            %L = imfilter(img_new, filter,'symmetric', 'conv');
            %L = imfilter(img_new, filter);
            
            
            
            Level = cat(3,Level,L);
            %% Calculate DoG
            if (i > 1)
                % Option to rescale the DoGs - Do not
                %D = rescale(L - Level(:,:,i-1));
                D = L - Level(:,:,i-1);
                DoG = cat(3,DoG, D );
                
            end
            %% Get the new L
            if (i==3)
                img_new = L;
            end
        end
        
        
        DoGs(j) = {DoG};
        spacescales(j) = {Level};
    end
    
end