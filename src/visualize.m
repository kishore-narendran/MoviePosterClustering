function [ visualization ] = visualize( indexes, posters, NUMBER_OF_POSTERS )
    centers = [ 2000 2000; 2000 8000; 8000 2000; 8000 8000; 5000 5000 ];
    visualization = zeros([10000 10000 3]);
    % resizing images to smaller resolutions for visualizing
    for i = 1:NUMBER_OF_POSTERS
        x = centers(indexes(i,1),:) + [(-1^randi(2))*randi(2000), (-1^randi(2))*randi(2000)];
        visualization(x(1,1):x(1,1)+1499, x(1,2):x(1,2)+999, :) = posters{i,1};
    end
end

