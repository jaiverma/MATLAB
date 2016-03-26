function [ image ] = filterify( img, fil, type )
%FILTERIFY clone of imfilter
%   img is the input image
%   fil is the input filter(can be of variable size)
%   type can either be 'conv' or 'corr' where 'conv' signifies convolution
%   and 'corr' signifies correlation
%   there is no padding in this function so the if the filter is a 3x3
%   filter, 1 row and 1 column would be omitted and for 5x5, 2 rows and 2
%   columns would be omitted in the calculation and so on...

s = size(img);
t = size(s);

if t(2) == 3
    img = im2double(rgb2gray(img));
else
    img = im2double(img);
end

fil = im2double(fil);

%correlation or convolution
%if conv then convolution otherwise correlation
if strcmp(type,'conv')
    fil = rot90(fil,2);
end

[image_rows,image_cols] = size(img);
image = zeros(image_rows,image_cols);
[filter_rows,filter_cols] = size(fil);

diff_rows = ceil(filter_rows/2);
diff_cols = ceil(filter_cols/2);

for row = 1:diff_rows
    image(row,:) = img(row,:);
end

for col = 1:diff_cols
    image(:,col) = img(:,col);
end

for row = image_rows-diff_rows:image_rows
    image(row,:) = img(row,:);
end

for col = image_cols-diff_cols:image_cols
    image(:,col) = img(:,col);
end

for row = diff_rows:image_rows-diff_rows+1
    for col = diff_cols:image_cols-diff_cols+1
        sum = 0;
        r = row-1;
        c = col-1;
        for i = 1:filter_rows
            for j = 1:filter_cols
                sum = sum + img(r+i-diff_rows+1,c+j-diff_cols+1)*fil(i,j);
            end
        end
        image(row,col) = sum;
    end
end

%scaling matrix to uint8 standards
%min value corresponds to 0
%max value corresponds to 255
%image = image - min(image(:));
%image = image ./ max(image(:));
%image = image ./ 255;

%im2uint8 does automatic scaling! comment out the following line to see
%normalized output, the line is currently commented out to see the
%difference between convolution and correlation in the test script
%otherwise all values above 1 are normalized to 255
%image = im2uint8(image);
end