img = imread('downtown.png');
img = rgb2gray(img);

%negative
neg_img = imcomplement(img);
imwrite(neg_img, 'downtown_negative.png');

%gamma transformations
%gamma = 1
g1 = imadjust(img,[],[],1);
%gamma = 3
g2 = imadjust(img,[],[],3);
%gamma = 0.4
g3 = imadjust(img,[],[],0.4);

imwrite(g1, 'downtown_g1.png');
imwrite(g2, 'downtown_g2.png');
imwrite(g3, 'downtown_g3.png');

%log transforms
im = im2double(img);

%c = 1
l1 = 1*log(1+im);
%c = 2
l2 = 2*log(1+im);
%c = 5
l3 = 4*log(1+im);

imwrite(l1, 'downtown_l1.png');
imwrite(l2, 'downtown_l2.png');
imwrite(l3, 'downtown_l3.png');

%log on domain
%log on domain [0,1]
f = im;
c = 1/log(1+1);
l4 = c*log(1+f);

%log on domain [0,255]
f = im * 255;
c = 1/log(1+255);
l5 = c*log(1+f);

imwrite(l4, 'downtown_l4.png');
imwrite(l5, 'downtown_l5.png');

%contrast stretching transform by changing E
m = mean2(im);
%E = 4
c1 = 1./(1+(m./(im+eps)).^4);
%E = 5
c2 = 1./(1+(m./(im+eps)).^5);
%E = 10
c3 = 1./(1+(m./(im+eps)).^10);

imwrite(c1, 'downtown_c1.png');
imwrite(c2, 'downtown_c2.png');
imwrite(c3, 'downtown_c3.png');

%contrast stretching transform by changing m with constant e = 4
%m = 0.3
c4 = 1./(1+(0.3./(im+eps)).^4);
%m = 0.6
c5 = 1./(1+(0.6./(im+eps)).^4);

imwrite(c4, 'downtown_c4.png');
imwrite(c5, 'downtown_c5.png');
