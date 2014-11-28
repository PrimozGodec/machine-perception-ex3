function imgResult = nonmaxsuppression2D(imgHough)
    for i = 1 : size(imgHough, 1) - 8
        for j = 1 : size(imgHough, 2) - 8
            if imgHough(i, j) < max(imgHough(i : i + 8, j : j + 8))
                imgHough(i, j) = 0;
            end
        end
    end
    imgResult = imgHough