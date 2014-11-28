im = double(imread('lena_gray_mini.png'));
[Ixx, Iyy, Ixy] = gaussderiv2(im, 1);

figure(1);
subplot(1, 4, 1); imagesc(im); colormap gray;
subplot(1, 4, 2); imagesc(Ixx); colormap gray;
subplot(1, 4, 3); imagesc(Ixy); colormap gray; 
subplot(1, 4, 4); imagesc(Iyy); colormap gray; 