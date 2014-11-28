im = double(imread('lena_gray_mini.png'));
L = laplace(im, 1);

figure(1);
subplot(1, 2, 1); imagesc(im); colormap gray;
subplot(1, 2, 2); imagesc(L); colormap gray;