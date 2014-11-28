function g = gauss(x, sigma)
    g = ( (1/(sqrt(2 * pi) * sigma))) .* exp(-(x .^ 2) ./ (2 * (sigma ^ 2)));
    g = g / sumabs(g);