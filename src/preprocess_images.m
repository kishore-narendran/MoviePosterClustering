function [ posters ] = preprocess_images( NUMBER_OF_POSTERS, SIZE )
    posters = cell(NUMBER_OF_POSTERS,1);
    for i = 1:NUMBER_OF_POSTERS
        poster = imread(strcat('posters/poster', int2str(i), '.jpg'));
        poster = imresize(poster, SIZE);
        poster = imgaussfilt(poster, 2);
        imwrite(poster, strcat('posters_resized/poster',int2str(i), '.jpg'));
        posters{i,1} = poster;
    end
end

