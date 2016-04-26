function [ average_colors ] = get_average_color( posters, NUMBER_OF_POSTERS, SIZE )
    block_size = SIZE/4;
    average_colors = zeros(NUMBER_OF_POSTERS, 48);
    for i  = 1:NUMBER_OF_POSTERS
        poster_blocks_red = mat2cell(posters{i,1}(:,:,1), ones(4, 1).*block_size(1), ...
            ones(4, 1).*block_size(2));
        poster_blocks_green = mat2cell(posters{i,1}(:,:,3), ones(4, 1).*block_size(1), ...
            ones(4, 1).*block_size(2));
        poster_blocks_blue = mat2cell(posters{i,1}(:,:,3), ones(4, 1).*block_size(1), ...
            ones(4, 1).*block_size(2));
        
        poster_blocks_red = cellfun(@mean2, poster_blocks_red);
        poster_blocks_green = cellfun(@mean2, poster_blocks_green);
        poster_blocks_blue = cellfun(@mean2, poster_blocks_blue);
        
        average_colors(i,:) = vertcat(poster_blocks_red(:), poster_blocks_green(:), poster_blocks_blue(:)).';
    end
end

