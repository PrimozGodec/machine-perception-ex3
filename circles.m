function circles(x,y,r)
    %x and y are the coordinates of the center of the circle
    %r is the radius of the circle
    %0.01 is the angle step, bigger values will draw the circle faster but
    %you might notice imperfections (not very smooth)
    for i= 1 : size(x, 1)
        circle(x(i), y(i), r);
    end
end