%% Demo 2
%%  Initialise
load('dip_hw_3.mat')
PARAM_PLOT_DoGs = 1;
img = rescale(mountains);
%img = roofs;
%imshow(mountains);
%img = rescale(imread('lena.jpg'));

%img = rescale(imread('venice.jpg'));

sigma = sqrt(2); K = 7; levels = 5; octaves = 3;


sigma = sqrt(2); K = 7; levels = 7; octaves = 3;
for K = [3 5 7 11 21]
    for sigma = [1.1 sqrt(2) 2*sqrt(2)]
        for octaves = [3 5]
            for levels = [5 7 11]
%% Calculate DoGs and Keypoints
[spacescales, DoGs] = myDoGs (img , K, sigma , levels , octaves );
keypoints = myKeypoints(DoGs);

%% Plot the DoGs with keypoints
if PARAM_PLOT_DoGs
figure;
for j=1:octaves
    size(DoGs{1,j})
    
    for i=1:(levels-1)
        subplot(octaves,levels,(j-1)*levels+i);

        %fprintf("indices: %d, %d, %d\n", j, i, (j-1)*levels+i);
        imshow(rescale(DoGs{1,j}(:,:,i))); hold on;
        
        title_text = sprintf('Octave: %d, Level: %d', j, i);
        title(title_text);
    end
end

main_title = sprintf('Demo2: K=%d, sigma=%.2f.', K, sigma );
set(gcf,'WindowState','maximized');
sgtitle(main_title)
for i = 1:size(keypoints,2)
    
    
    k = num2cell(keypoints{i});
    [o, s, m, n] = k{:};
    hold on
    %axis on
    
    sub = subplot(octaves,levels,(o-1)*levels+s);

    %subplot(octaves,levels,(o-1)*levels+s);
    
    plot(sub, m,n,'c*', 'MarkerSize', 10)
    hold off

end
hold off
end
% STOP! Rmoving this return generates lots of images with different
% HYPERPARAMETERS
return
%% Discard Low Contrasted Keypoints
n_spo = levels - 2;
t = ((2^(1 / n_spo) - 1) / (2 ^ (1/3) -1)) * 0.015; p = 0.08*40%*0.8;

keypointsHighC = discardLowContrasted (DoGs , keypoints , t, p);

%% Plot the Final Keypoints
            
figure;
title_text = sprintf('Octaves: %d, Levels: %d, K: %d, sigma:%.2f', octaves, levels, K, sigma);
title(title_text);
imshow(img)
set(gcf, 'PaperPositionMode', 'auto')
hold on
kpts_mat = cell2mat(keypointsHighC(:))
xs = kpts_mat(:,3);
ys = kpts_mat(:,4);
plot( ys,xs,'r*', 'MarkerSize', 7);
hold off
% Linux path!!!
filename = sprintf("img_venice_octave%d_levels_%d_K%d_sigma%.2f_.png", octaves, levels, K, sigma);
fname = '/home/mainuser/Work/dip/ergasia3/code/images/';
saveas(gcf, fullfile(fname, filename));

close(gcf)

            end
        end
    end
end
