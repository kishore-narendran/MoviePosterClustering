% 375 250
img = posters{20,1};
col_img = ones(size(posters{20,1}));
for i = 1:4
    for j = 1:4
        disp (((i-1)*375)+1);
        disp(375*i)
        disp(((j-1)*375)+1);
        disp(250*j);
        sub = img(((i-1)*375)+1:375*i,((j-1)*250)+1:250*j,:);
        meanr = mean2(sub(:,:,1));
        meang = mean2(sub(:,:,2));
        meanb = mean2(sub(:,:,3));
        col_img(((i-1)*375)+1:375*i,((j-1)*250)+1:250*j,1) = meanr;
        col_img(((i-1)*375)+1:375*i,((j-1)*250)+1:250*j,2) = meang;
        col_img(((i-1)*375)+1:375*i,((j-1)*250)+1:250*j,3) = meanb;
    end
end
figure;
subplot(1,2,1);
imshow(posters{20,1});
title('Movie Poster');
subplot(1,2,2);
imshow(uint8(col_img));
title('Average Colors in 4x4 Blocks');