function [out_ro, out_theta] = houghfindlines_ang(Ie, Idir, nBinsRo, nBinsTheta, tresh)
    A = zeros(nBinsRo, nBinsTheta);
    d = sqrt(sum(size(Ie) .^ 2));
    
    % calculating A
    places = find(Ie);
    [y, x] = ind2sub(size(Ie), places);
    y = y - 1; x = x - 1;
    dirs = Idir(places);
    % restriction on int [-pi/2 to pi/2]
    dirs(dirs < -(pi/2)) = dirs(dirs < -(pi/2)) + pi;
    dirs(dirs > (pi/2)) = dirs(dirs > (pi/2)) - pi;
    
    thetas_i = floor((dirs + pi/2) .* (nBinsTheta - 1) ./ pi) + 1 ;   
    
    ro_i = floor(((x .* cos(dirs) + y .* sin(dirs)) + d) ./ (2 * d) .* nBinsRo);
    
    subs = [ro_i, thetas_i];
    
    Asm = accumarray(subs, 1);
    [ah, aw] = size(Asm);
    
    A(1: ah, 1: aw) = Asm;
    
    figure(1);
    imagesc(A);
    A(A < tresh) = 0;
    
    edglin = find(A);
    [ero, etheta] = ind2sub(size(A), edglin);
    values = A(edglin);
    
    % take only best 10
    rtv_i = [ero, etheta, values];
    rtv_i = flipud(sortrows(rtv_i, 3));
    rtv_i = rtv_i(1:10, :);
   
    % convert to real ro and theta
    r_i = rtv_i(:, 1);
    t_i = rtv_i(:, 2);
    r = r_i ./ nBinsRo .* (2 * d) - d;
    t = t_i ./ nBinsTheta .* pi - (pi / 2);
    

    figure(4);

    drawlines(t, r, size(Ie, 2), size(Ie, 1));
    
    out_ro = r;
    out_theta = t;
    
    
    