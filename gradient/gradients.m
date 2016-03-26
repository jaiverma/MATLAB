i = imread('xray.jpg');
i = rgb2gray(i);

%define prewitt filter
prewitt_x = [-1 -1 -1; 0 0 0; 1 1 1];
prewitt_y = [-1 0 1; -1 0 1; -1 0 1];

%define sobel filter
sobel_x = [-1 -2 -1; 0 0 0; 1 2 1];
sobel_y = [-1 0 1; -2 0 2; -1 0 1];

%applying prewitt filter
i_p_x = filterify(i,prewitt_x,'corr');
i_p_y = filterify(i,prewitt_y,'corr');

%M matrix
M_prewitt = abs(i_p_x) + abs(i_p_y);

%alpha matrix in degrees
Alpha_prewitt = atand(i_p_y/i_p_x);

%save to disk
imwrite(M_prewitt,'xray_M_prewitt.jpg');
imwrite(Alpha_prewitt, 'xray_Alpha_prewitt.jpg');

imshow(M_prewitt);
figure, imshow(Alpha_prewitt);

%applying sobel filter
i_s_x = filterify(i,sobel_x,'corr');
i_s_y = filterify(i,sobel_y,'corr');

%M matrix
M_sobel = abs(i_s_x) + abs(i_s_y);

%alpha matrix in degrees
Alpha_sobel = atand(i_s_y/i_s_x);

%save to disk
imwrite(M_sobel,'xray_M_sobel.jpg');
imwrite(Alpha_sobel, 'xray_Alpha_sobel.jpg');

figure, imshow(M_sobel);
figure, imshow(Alpha_sobel);