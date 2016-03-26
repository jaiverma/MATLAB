img = imread('map.png');
img = rgb2gray(img);

img = histeq(img);

imwrite(img, 'map_hist_eq.png');

xaxis = linspace(0,255,50);
yaxis = imhist(img,50);

stem(xaxis,yaxis);
title('histogram equilization');