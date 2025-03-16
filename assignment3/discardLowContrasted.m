function keypointsHighC = discardLowContrasted (DoGs , keypoints , t, p)

    V = size(keypoints,2);
    
    %kpts_matr = cell2mat(keypoints(:));
    
    %w = DoGs{kpts_matr(:,1)}(kpts_matr(:,3),kpts_matr(:,4),kpts_matr(:,2));

    %p = 1000*p;
    tp_prod = t*p;
    
    
    %size(w)
    keypointsHighC = {};%cell(1,V);
    %% Iterate over old keypoints
    for kp = 1:V

        o = keypoints{kp}(1);
        s = keypoints{kp}(2);
        m = keypoints{kp}(3);
        n = keypoints{kp}(4);
        

        w = DoGs{o}(m, n, s);
        
        check = (abs(w) <= p * t);
        %fprintf("kp: %d, w is:%.4f, tp_prod: %.4f gr or eq is: %d\n", kp,
        %w, tp_prod, check);
        %% Fliter out low contrasted points.
        if abs(w) > p * t
            %disp("eadedea")
            %keypoints(kp) = [];
            %kp = kp -1;
            keypointsHighC = cat(2, keypointsHighC, keypoints{kp});
        end
        
    end
        

end