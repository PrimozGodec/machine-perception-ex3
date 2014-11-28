function [Ixx, Iyy, Ixy] = gaussderiv2(img, sigma)
    x = [round(-3.0 * sigma) : round(3.0 * sigma)];

    G = gauss(x, sigma);
    D = gaussdx(x, sigma);
    
    [Ix, Iy] = gaussderiv(img, sigma);
    
    Ixx = conv2(conv2(Ix, G', 'valid'), D, 'valid');
    Ixy = conv2(conv2(Ix, G, 'valid'), D', 'valid');
    Iyy = conv2(conv2(Iy, G, 'valid'), D', 'valid');
        