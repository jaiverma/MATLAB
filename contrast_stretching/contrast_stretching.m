%contrast stretching and stem histogram
img = imread('map.png');
img = rgb2gray(img);
[rows, cols] = size(img);

intensity_low = 190;
intensity_high = 230;

img2 = img;

%linear and enhance
for row = 1:rows
    for col = 1:cols
        if img2(row,col) > intensity_low && img2(row,col) < intensity_high
            img2(row,col) = 50;
        end
    end
end

imwrite(img2, ' map_contrast_linear.png');

xaxis = linspace(0,255,50);
yaxis = imhist(img2,50);
stem(xaxis,yaxis);
title('linear contrast stretching');

%non linear contrast stretching (enhace specified region and make other
%region constant
img2 = img;

for row = 1:rows
    for col = 1:cols
        if img2(row,col) > intensity_low && img2(row,col) < intensity_high
            img2(row,col) = 50;
        else
            img2(row,col) = 240;
        end
    end
end

imwrite(img2,'map_non_linear_contrast.png');

yaxis = imhist(img2, 50);
figure, stem(xaxis,yaxis);
title('non linear contrast stretching');