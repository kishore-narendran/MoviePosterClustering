function [ color_feature_vector ] = get_color_histogram( img )
    number_of_pixels = size(img, 1) * size(img, 2);
    countsr = imhist(img(:,:,1), 10) / number_of_pixels;
    countsg = imhist(img(:,:,2), 10) / number_of_pixels;
    countsb = imhist(img(:,:,3), 10) / number_of_pixels;
    color_feature_vector = vertcat(countsr, countsg, countsb).';
    
    subplot(1,2,1);
    imshow(img);
    title('Movie Poster Image');
    subplot(1,2,2);
    bar_handle = bar(vertcat(countsr', countsg', countsb')');
    title('Color Histogram');
    ylabel('Fraction of Pixels');
    xlabel('Bins');
    legend('R','G','B');
    set(bar_handle(1),'FaceColor','r');
    set(bar_handle(2),'FaceColor','g');
    set(bar_handle(3),'FaceColor','b');
end