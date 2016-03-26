%grayscale image plot stem histogram
img = imread('map.png');
img = rgb2gray(img);

xaxis = linspace(0,255,50);
yaxis = imhist(img,50);

imwrite(img,'map_bw.png');

stem(xaxis,yaxis);
title('grayscale');