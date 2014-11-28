tic
im = double(rgb2gray(imread('circle1.png')));
Ie = findedges(im, 1, 30);
r = 100;
figure(3);
imagesc(uint8(im)); colormap gray;

figure(4);
imagesc(Ie);
[a, b] = houghfindcircle(Ie, 1, r)  %[1 0; 0 1]

figure(4); hold on;
circles(a, b, r)
toc