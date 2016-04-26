function [ sift_features, sift_histogram ] = get_sift_histogram( sift_features, NUMBER_OF_POSTERS, k )
    total_sift_features = [];
    for i = 1:NUMBER_OF_POSTERS
        total_sift_features = horzcat(total_sift_features, sift_features{i,2});
    end
    total_sift_features = double(total_sift_features');
    sift_histogram_total = kmeans(total_sift_features, k, 'MaxIter',1000);%, 'Options',statset('UseParallel',1));
    
    starting = 1;
    sift_histogram = zeros(NUMBER_OF_POSTERS,k);
    for i = 1:NUMBER_OF_POSTERS
        ending = starting + size(sift_features{i,2}, 2) - 1;
        sift_features{i,3} = sift_histogram_total(starting:ending,1);
        sift_features{i,4} = histcounts(sift_features{i,3}, 1:k+1);
        starting = ending + 1;
        sift_histogram(i,:) = sift_features{i,4};
    end
end

