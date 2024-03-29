function Imax = nonmaxsup(Imag, Idir)
    [h, w] = size(Imag);
    Imax = zeros(h, w);
    offx = [-1 -1 0 1 1 1 0 -1 -1] ;
    offy = [0 -1 -1 -1 0 1 1 1 0] ;
    for y = 1 : h
        for x = 1 : w
            dir = Idir(y, x); % check p i x e l o r i e n t a t i o n
            idx = round(((dir + pi) / pi) * 4) + 1 ; % map o r i e n t a t i o n to the lookup t a bl e
            y1 = y + offy(idx); x1 = x + offx(idx);
            y2 = y - offy(idx); x2 = x - offx(idx);
            x1 = max([1, x1]); x1 = min([w, x1]);
            y1 = max([1, y1]); y1 = min([h, y1]);
            x2 = max([1, x2]); x2 = min([w, x2]);
            y2 = max([1, y2]); y2 = min([h, y2]);
            if((Imag(y, x) >= Imag(y1, x1))&&(Imag(y, x) >= Imag(y2, x2)))
                Imax(y, x) = Imag(y, x);
            end
        end
    end
            