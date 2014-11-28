tic
im = double(rgb2gray(imread('lines.jpg')));
Ie = findedges(im, 1, 30);
[Imag, Idir] = gradmag(im, 1);
figure(3);
imagesc(uint8(im)); colormap gray;

figure(4);
imagesc(Ie);
houghfindlines_ang(Ie, Idir, 1000, 1000, 1);  %[1 0; 0 1]
toc
