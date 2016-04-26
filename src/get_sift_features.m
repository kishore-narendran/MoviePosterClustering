function [ sift_features ] = get_sift_features( posters, NUMBER_OF_POSTERS )
    sift_features = cell(NUMBER_OF_POSTERS, 2);
    for i = 1:NUMBER_OF_POSTERS
        [ f, d ] = vl_sift(single(rgb2gray(posters{i,1})));
        sift_features{i,1} = f;
        sift_features{i,2} = d;
    end
end

