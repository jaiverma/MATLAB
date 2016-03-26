%increase or decrease intensity by multiplying pixel values by a number
img = imread('BerkeleyTower.png');
%increase intensity
intensity_factor = 2;

%decrease intensity
%intensity_factor = 1/2;

img = img * intensity_factor;

imwrite(img, 'BerkeleyTower_intensity.png');

%contrast variation
img = imread('BerkeleyTower.png');
img = rgb2gray(img);
[rows,cols] = size(img);

for row = 1:rows
    for col = 1:cols
        if img(row,col) > 60 && img(row,col) < 80
            img(row,col) = 180;
        elseif img(row,col) < 60 && img(row,col) > 80
            img(row,col) = 30;
        end
    end
end

imwrite(img, 'BerkeleyTower_contrast.png');