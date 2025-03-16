%% Demo1
%% Initialise
load('dip_hw_3.mat')
% Matlab version
% disp(version) ->> ans = '9.5.0.944444 (R2018b)'

K = 20;
sigma = 3;

% any(my2DGaussianFilter(5, sqrt(2)) == fspecial('gaussian',[5,5],sqrt(2)), 'all')
f = my2DGaussianFilter(K, sigma);

%mesh(f);
%% Calculate DoGs


%img = mountains;
img = roofs;
%imshow(mountains);
%img = rescale(imread('lena.jpg'));
sigma = sqrt(2); K = 7; levels = 5; octaves = 3;
%K=3;
%sigma = 0.5;
[spacescales, DoGs] = myDoGs (img , K, sigma , levels , octaves );


%% Plot the Space Scales along woth the DoGs.
set(gcf,'WindowState','maximized');
for j=1:octaves
    for i=1:levels
        subplot(octaves,levels,(j-1)*levels+i);

        %fprintf("indices: %d, %d, %d\n", j, i, (j-1)*levels+i);
        imshow(spacescales{1,j}(:,:,i));
        
        title_text = sprintf('Octave: %d, Level: %d', j, i);
        title(title_text);
    end
end
figure;
% Plot the DoGs
main_title = sprintf('Demo2: sigma: K=%d, sigma=%.2f.', K, sigma );
size(DoGs)
for j=1:octaves
    size(DoGs{1,j})
    
    for i=1:(levels-1)
        subplot(octaves,levels,(j-1)*levels+i);

        %fprintf("indices: %d, %d, %d\n", j, i, (j-1)*levels+i);
        imshow(rescale(DoGs{1,j}(:,:,i)));
        
        title_text = sprintf('Octave: %d, Level: %d', j, i);
        title(title_text);
    end
end

%sigma = 2; K = 7; levels = 3; octaves = 7;