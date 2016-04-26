function [ descriptor ] = mygist( img, orientations, scales, wavelength )
    % GIST Descriptor Generator Function
    orientations = 360/orientations * [ 0:orientations-1 ];
    g = gabor(wavelength,orientations);
    descriptor = [];
    for i = 1:scales
        img = imresize(img, round(size(img)/4)*4);
        gist_descriptor1 = imgaborfilt(img,g);
        for j = 1:size(orientations,2)
            fun = @(block_struct) mean2(block_struct.data);
            gist_descriptor_temp = blockproc(gist_descriptor1(:,:,j), size(img)/4, fun);
            descriptor = vertcat(descriptor, gist_descriptor_temp(:));
        end
        img = imresize(img, 0.5);
    end
end

