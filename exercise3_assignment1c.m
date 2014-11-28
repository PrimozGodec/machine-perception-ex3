impulse = zeros(25, 25); impulse(13, 13) = 255;

sigma = 6.0;
x = [round(-3.0 * sigma) : round(3.0 * sigma)];

G = gauss(x, sigma);
D = gaussdx(x, sigma);

% G and G'
a = conv2(conv2(impulse, G), G');

% G and D'
b = conv2(conv2(impulse, G), D');

% D and G'
c = conv2(conv2(impulse, D), G');

% G' and D
d = conv2(conv2(impulse, G'), D);

% D' and G
e = conv2(conv2(impulse, D'), G);


figure(1);
subplot(1, 5, 1); imagesc(a);
subplot(1, 5, 2); imagesc(b);
subplot(1, 5, 3); imagesc(c);
subplot(1, 5, 4); imagesc(d);
subplot(1, 5, 5); imagesc(e);
