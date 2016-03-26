%horizontal edge linking

i = imread('bw.jpeg');

%using sobel filter
filter_x = [-1 -2 -1; 0 0 0; 1 2 1];
filter_y = [-1 0 1; -2 0 2; -1 0 1];

%applying sobel filter
i_x = filterify(i, filter_x, 'corr');
i_y = filterify(i, filter_y, 'corr');

M = abs(i_x) + abs(i_y);
M = im2uint8(M);
Temp = M;

%defining threshold
th = 6;

[rows,cols] = size(M);

%thresholding
for row = 1:rows
    for col = 1:cols
        if M(row,col) < 150
            M(row,col) = 0;
        else
            M(row,col) = 255;
        end
    end
end

%edge linking algorithm
marker1 = -1;
count = 0;
for row = 1:rows
    for col = 1:cols
        if M(row,col) == 255
            if marker1 ~= -1
                marker2 = col;
                if count <= th
                    M(row,marker1:marker2) = 255;
                    marker1 = marker2;
                    count = 0;
                else
                    marker1 = marker2;
                    count = 0;
                end
            else
                marker1 = col;
                count = 0;
            end
        else
            count = count + 1;
        end
    end
end

%save file to disk
imwrite(M,'bw_edge.jpeg');

imshow(M);
figure, imshow(Temp);