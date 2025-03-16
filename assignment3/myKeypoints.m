function keypoints = myKeypoints (DoGs)

    keypoints = {};%cell();
    count = 0;
    
    % Iterate over every point of DoG
    for o = 1:size(DoGs)
        for s = 2:(size(DoGs{o},3)-1)
            
            [N, M] = size(DoGs{o}(:,:,s));
            
            for n = 2:(N-1)
                for m= 2:(M-1)
                    count = count + 1;
                    %fprintf('(o,s): (%d, %d).  m, n is: (%d, %d )\n', o, s, n, m)
                    
                    %% Get neighbohood, remove center,
                    %26 + 1 neighbourhood 
                    neihbors = DoGs{o}(n-1:n+1,m-1:m+1,s-1:s+1);
                    neihbors = neihbors(:);
                    center = neihbors(14);
                    neihbors(14) = [];
                    
                    maximum = max(neihbors , [], 'all');
                    minimum = min(neihbors , [], 'all');
                    % compare with min, max, add if need
                    if center > maximum || center < minimum
                       %add point to keypoints 
                       keypoints = cat(2,keypoints,[o s m n]);
                       
                    end
                    
                end
            end 
        end
    end
    
    %keypoints = [];

end