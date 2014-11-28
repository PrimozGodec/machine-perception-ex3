function Ie = findedges(I, sigma, theta)
    [Gmag, Gdir] = gradmag(I, sigma);
    
    Ied = nonmaxsup(Gmag, Gdir);
    Ie = Ied >= theta;