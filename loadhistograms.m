function histograms = loadhistograms(listing, bins, nogrid)
    dir = fileparts(listing);
    files = readfile(listing, ',');
    histograms = zeros(size(files, 2), bins * nogrid ^ 2);
    
    for i = 1 : size(files, 2)
        imhist = [];
        I = imread(fullfile(dir, files{i}));
        [Imag, Idir] = gradmag(double(rgb2gray(I)), 1);
        
        [h, w] = size(Imag);
        gridsize_x = floor(w / nogrid);
        gridsize_y = floor(h / nogrid);
        
        for x = 0 : (nogrid - 1)
            for y = 0 : (nogrid - 1)
                from_x = x * gridsize_x + 1;
                to_x = (x + 1) * gridsize_x;
                from_y = y * gridsize_y + 1;
                to_y = (y + 1) * gridsize_y;
                
                Imag_p = Imag(from_y : to_y, from_x : to_x);
                Idir_p = Idir(from_y : to_y, from_x : to_x);
                
%                 min(min(Idir_p))
%                 max(max(Idir_p))
                Idir_pi = floor((Idir_p + pi) ./ (2 * pi) .* (bins - 0.001)) + 1; % 7.99 because interval from -pi to pi included
%                 max(max(Idir_pi))
%                 min(min(Idir_pi))
                %accumarray(Idir_pi(:), Imag_p(:))
                hist = accumarray(Idir_pi(:), Imag_p(:));
                imhist = [imhist; hist; zeros(bins - size(hist, 1), 1)];
            end
        end
%         size(imhist)
%         size(histograms)
        histograms(i, :) = imhist(:);
    end
    