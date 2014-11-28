function [Ix, Iy] = gaussderiv(img, sigma)
    x = [round(-3.0 * sigma) : round(3.0 * sigma)];

    G = gauss(x, sigma);
    D = gaussdx(x, sigma);
    
    Ix = conv2(conv2(img, G', 'valid'), D, 'valid');
    Iy = conv2(conv2(img, G, 'valid'), D', 'valid');
        