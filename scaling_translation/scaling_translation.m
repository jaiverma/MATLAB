%generate image
img = zeros(1000);
for i = 100:200
    for j = 100:300
        img(i,j) = 255;
    end
end

i = img;
imwrite(img, 'box.png');

%scaling
scaling_factor = 3;
for row = 100:200
    for col = 100:300
        img(scaling_factor*row, scaling_factor*col) = img(row,col);
        img(row,col) = 0;
    end
end

imwrite(img, 'scaled_box.png');

%translation
translation_index_x = 400;
translation_index_y = 600;
for row = 100:200
    for col = 100:300
        i(row+translation_index_x,col+translation_index_y) = i(row,col);
        i(row,col) = 0;
    end
end

imwrite(i, 'translated_box.png');