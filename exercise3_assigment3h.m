tic
im = double(rgb2gray(imread('lines.jpg')));
Ie = findedges(im, 1, 30);
[Imag, Idir] = gradmag(im, 1);
figure(3);
imagesc(uint8(im)); colormap gray;

figure(4);
imagesc(Ie);
no_pieces = 3;
x_s = floor(size(Ie, 2) / no_pieces );
y_s = floor(size(Ie, 1) / no_pieces );
for i = 0 : (no_pieces - 1)
    for j = 0 : (no_pieces - 1)
        from_x = i * x_s + 1
        from_y = j * y_s + 1
        to_x = (i + 1) * x_s
        to_y = (j + 1) * y_s
         d = sqrt(sum(size(Ie) .^ 2));
        
        Ie_p = Ie(from_y : to_y, from_x : to_x);
        Imag_p = Imag(from_y : to_y, from_x : to_x);
        Ideg_p = Idir(from_y : to_y, from_x : to_x);
        
        figure(7); clf;
        %imagesc(Ie_p);
        
        [r, t] = houghfindlines_ang_mag(Ie_p, Ideg_p, Imag_p, 1000, 1000, 1, from_x, from_y, d);
        figure(4);
        drawlines(t, r, size(Ie, 2), size(Ie, 1));
%         pause(5);
    end
end
toc