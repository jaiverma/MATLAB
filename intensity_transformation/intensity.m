%intensity transformations and stem histogram

img = imread('map.png');
img = rgb2gray(img);
[rows, cols] = size(img);

%add 50 to intensity
img2 = img;

for row = 1:rows
    for col = 1:cols
        img2(row,col) = img2(row,col) + 50;
    end
end

imwrite(img2, 'map_intensity_plus_50.png');

xaxis = linspace(0,255,50);
yaxis = imhist(img2,50);
stem(xaxis,yaxis);
title('intensity plus 50');

%image negative
img2 = img;

for row = 1:rows
    for col = 1:cols
        img2(row,col) = 255 - img2(row,col);
    end
end

imwrite(img2, 'map_negative.png');

yaxis = imhist(img2,50);
figure, stem(xaxis,yaxis);
title('image negative');

%gamma transformation
img2 = img;

%gamma = 3
g = imadjust(img2,[],[],3);
imwrite(g, 'map_gamma3.png');
yaxis = imhist(g,50);
figure, stem(xaxis,yaxis);
title('gamma = 3');

%gamma = 0.4
g = imadjust(img2,[],[],0.4);
imwrite(g, 'map_gamma0.4.png');
yaxis = imhist(g,50);
figure, stem(xaxis,yaxis);
title('gamma = 0.4');