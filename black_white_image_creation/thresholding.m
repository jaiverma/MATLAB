%black and white image creation using zeros function
im = zeros(500);
for row = 200:250
    for col = 200:300
        im(row,col) = 255;
    end
end

imwrite(im, 'bw.png');

%grayscale image creation using rgb2gray
img = imread('BerkeleyTower.png');
img = rgb2gray(img);
[rows, cols] = size(img);

%set threshold value
thresh = 100;

%thresholding to create binary b and w image
for row = 1:rows
    for col = 1:cols
        if img(row,col) > thresh
            img(row,col) = 255;
        else
            img(row,col) = 0;
        end;
    end;
end;

imwrite(img, 'BerkeleyTower_bw.png');
