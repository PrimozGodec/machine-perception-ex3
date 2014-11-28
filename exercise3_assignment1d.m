im = double(imread('lena_gray_mini.png'));
[Ix, Iy] = gaussderiv(im, 1);

figure(1);
subplot(1, 3, 1); imagesc(im); colormap gray;
subplot(1, 3, 2); imagesc(Ix); colormap gray;
subplot(1, 3, 3); imagesc(Iy); colormap gray; 
