img = imread('pattern.png');
img = rgb2gray(img);
[rows, cols] = size(img);

%set threshold value as 127%
thresh = 127;

%thresholding to convert image to black and white%
for row = 1:rows
    for col = 1:cols
        if img(row,col) > thresh
            img(row,col) = 255;
%             img(row,col) = 0;
        else
            img(row,col) = 0;
%             img(row,col) = 255;
        end;
    end;
end;

imwrite(img,'intermediate.png');

colour = 10;
for row = 1:rows
    for col = 1:cols
        if img(row,col) == 255
            if colour >= 255
                colour = 10;
            end
            img = dfs(img,row,col,colour);
            colour = colour + 10;
        end
    end
end

imwrite(img, copper, 'result.png');
imagesc(img);