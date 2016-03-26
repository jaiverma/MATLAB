img = imread('text.jpg');

%applying sobel filter using my algorithm using correlation
filter = fspecial('sobel');
my_img = filterify(img,filter,'corr');

%applying sobel filter using imfilter algorithm
filter_img = imfilter(img,filter,'replicate');

%comparing the 2 images
imshow(my_img);
title('My filter function');
figure, imshow(filter_img);
title('Default filter function');

%code to compare correlation and convolution
img = zeros(5);
img(3,3) = 1;

filter = [1 2 3;4 5 6;7 8 9];

disp('Correlation:');
x = filterify(img,filter,'corr');
disp(x);

disp('Convolution:');
y = filterify(img,filter,'conv');
disp(y);