%black and white invert
img = imread('Rachmaninoff.jpg');
img = rgb2gray(img);
[rows, cols] = size(img);

for row = 1:rows
    for col = 1:cols
        img(row,col) = 255 - img(row,col);
    end
end

imwrite(img, 'Rachmaninoff_bw_inverted.jpg');

%color invert
img = imread('BerkeleyTower.png');
[rows, cols, colours] = size(img);

for row = 1:rows
    for col = 1:cols
        for colour = 1:colours
            img(row,col,colour) = 255 - img(row,col,colour);
        end
    end
end

imwrite(img, 'BerkeleyTower_inverted.png');
