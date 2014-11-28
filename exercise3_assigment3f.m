tic
im = double(rgb2gray(imread('lines.jpg')));
Ie = findedges(im, 1, 30);

figure(3);
imagesc(uint8(im)); colormap gray;

figure(4);
imagesc(Ie);
houghfindlines(Ie, 1000, 1000, 1);  %[1 0; 0 1]
toc