im = double(imread('lena_gray_mini.png'));

figure(1);
for i=1:9
    Ie = findedges(im, 0.8, 2 + 4 * i);
    
    subplot(3, 3, i); imagesc(Ie); colormap gray;
    title(2 + 4 * i);
end



