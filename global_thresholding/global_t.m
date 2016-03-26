img = imread('low1.jpg');
%img = rgb2gray(img);

%no of pixels on each intensity from 0 to 255
hist = imhist(img);
[hist_size,a] = size(hist);


%starting threshold
%splitting point to divide image into 2 classes c1 & c2
thresh = 190;
delta = 5;

c1_min = 0;
c1_max = 0;
c2_min = 0;
c2_max = 0;

while 1
    %find min and max intensity values for each class
    for i = 1:thresh
        if hist(i) > 0
            c1_min = i;
            break;
        end
    end

    for i = 1:thresh
        if hist(i) > 0
            c1_max = i;
        end
    end

    for i = thresh+1:hist_size
        if hist(i) > 0
            c2_min = i;
            break;
        end
    end

    for i = thresh+1:hist_size
        if hist(i) > 0
            c2_max = i;
        end
    end

    %calculate mean thresholds for each class
    m1 = (c1_min + c1_max - 2) / 2;
    m2 = (c2_min + c2_max - 2) / 2;

    new_thresh = (m1 + m2) / 2;

    delta_t = abs(new_thresh - thresh);
    thresh = floor(new_thresh);

    if delta_t <= delta
        break
    end
end


%apply thresholding using new threshold
[rows,cols] = size(img);

for row = 1:rows
    for col = 1:cols
        if img(row,col) >= thresh
            img(row,col) = 255;
        else
            img(row,col) = 0;
        end
    end
end

imwrite(img, 'low1_global.jpg');
%imwrite(img, 'low2_global.jpg');
imshow(img);