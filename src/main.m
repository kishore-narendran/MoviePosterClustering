% Adding necessary paths
run('../lib/vlfeat-0.9.20/toolbox/vl_setup');

% Intitializing the number of posters in the dataset and the size to work
% on during the entire clustering process

NUMBER_OF_POSTERS = 44;
SIZE = [1500 1000];

% Resizing the images into a common size and 
% Smoothing the poster images using gaussian smoothing

posters = preprocess_images(NUMBER_OF_POSTERS, SIZE);

% Feature Extraction

sift_features = get_sift_features(posters, NUMBER_OF_POSTERS);
[ sift_features, sift_histogram ] = get_sift_histogram(sift_features, NUMBER_OF_POSTERS, 100);
gist_features = get_gist_features(posters, NUMBER_OF_POSTERS);
color_features =get_average_color(posters, NUMBER_OF_POSTERS, SIZE);
features = horzcat(sift_histogram, color_features);
 
idx = kmeans(features, 5, 'MaxIter', 1000);
% % for count = 15:44
% %     subplot(6,5,count-14);
% %     imshow(posters{count,1});
% %     title(strcat('Cluster ', int2str(idx(count,1))));
% % end
figure;
visualization  = visualize(idx, posters, NUMBER_OF_POSTERS);
imshow(uint8(visualization));
