function [a_fin, b_fin] = houghfindcircle(Ie, tresh, r)
    [Ie_h, Ie_w] = size(Ie);
    A = zeros(Ie_h, Ie_w);
        
    % calculating A
    places = find(Ie);
    [y, x] = ind2sub(size(Ie), places);
%     y = y - 1; x = x - 1;
    a = 1:Ie_w;
    
    x_r = repmat(x, [1, size(a, 2)]);
    a_r = repmat(a,[size(x, 1), 1]);
    y_r = repmat(y, [1, size(a, 2)]);
    
    b1 = y_r - sqrt(r ^ 2 - (x_r - a_r) .^ 2);
    b2 = y_r + sqrt(r ^ 2 - (x_r - a_r) .^ 2);
    
    a_lin = [a_r(:), a_r(:)];
    b = round([b1(:); b2(:)]);
    cond = and(and(imag(b) == 0, b > 0), b < Ie_h);
    a_lin = a_lin(cond);
    b = b(cond);
    
    subs = [b, a_lin];
        
    Asm = accumarray(subs, 1);
    [ah, aw] = size(Asm);
    
    A(1: ah, 1: aw) = Asm;
    
    figure(1);
    imagesc(A);
    A(A < tresh) = 0;
    
    edglin = find(A);
    [a_best, b_best] = ind2sub(size(A), edglin);
    values = A(edglin);
    
    % take only best 10
    abv = [b_best, a_best, values];
    abv = flipud(sortrows(abv, 3));
    abv = abv(1:4, :);
   
    a_fin = abv(:,1);
    b_fin = abv(:,2);
    
    
    