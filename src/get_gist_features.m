function [ features ] = get_gist_features( posters, NUMBER_OF_POSTERS )
    % GIST Parameters:
    clear param
    param.imageSize = [1500 1000];
    param.orientationsPerScale = [8 8 8 8]; % number of orientations per scale (from HF to LF)
    param.numberBlocks = 4;
    param.fc_prefilt = 4;


    % Computing gist
    for i = 1:NUMBER_OF_POSTERS
        [gist, param] = LMgist(posters{i,1}, '', param);
        features(i,:) = gist;
    end
end

