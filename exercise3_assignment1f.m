im = double(imread('lena_gray_mini.png'));
[Imag, Idir] = gradmag(im, 1);
% [Gmag,Gdir] = imgradient(im);

figure(1);
subplot(1, 3, 1); imagesc(im); colormap gray;
subplot(1, 3, 2); imagesc(Imag); colormap gray;
subplot(1, 3, 3); imagesc(Idir); colormap gray; 

% figure(2);
% subplot(1, 3, 1); imagesc(im); colormap gray;
% subplot(1, 3, 2); imagesc(Gmag); colormap gray;
% subplot(1, 3, 3); imagesc(Gdir); colormap gray; 
