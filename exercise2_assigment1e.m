filename = 'images.txt';
hists = loadhistograms(filename, 8, 8);
distances = [];
comparehist = hists(8, :);

for h = hists'
    distances = [distances; ...
        comparehistograms(comparehist, h', 'l2'), ...
        comparehistograms(comparehist, h', 'chi2'), ...
        comparehistograms(comparehist, h', 'hellinger'), ...
        comparehistograms(comparehist, h', 'intersect')];
end
size(distances)
% read imge names
dir = fileparts(filename);
files = readfile(filename, ',');

for j = 1:4
    [d, ids] = sort(distances(:, j));

    figure(j); clf; 

    for i = 1:6
        subplot(2, 6, i);
        imshow(imread(files{ids(i, 1)}));
        subplot(2, 6, 6 + i);
        bar(hists(ids(i), :));
    end
end