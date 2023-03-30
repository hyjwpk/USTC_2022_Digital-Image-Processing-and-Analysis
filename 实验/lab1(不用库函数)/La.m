clc;
clear;
close all;


% This is the lab for digital image courses
% Task 1-4


source = imread("alphabet2.jpg");
right = imread("alphabet1.jpg");
[r, c, l] = size(source);
output = zeros(r,c);

x1=1;
y1=1;
x2=1;
y2=1;
x3=224;
y3=1;
x4=234;
y4=1;
x5=1;
y5=224;
x6=1;
y6=236;

% 用户输入完成
A = [1, x2, y2; 1, x4, y4; 1, x6, y6];
X = [x1, x3, x5]';
Y = [y1, y3, y5]';
a = A\X; 
b = A\Y;

a0 = a(1); a1 = a(2); a2 = a(3);
b0 = b(1); b1 = b(2); b2 = b(3);

opmatrix = [a1 a2 a0; b1 b2 b0; 0 0 1];

for i = 1 : 224
	for j = 1 : 224
        w = 1;
		pixel = [w*j; w*i; w];
		pixel = opmatrix * pixel;
		x = pixel(1, 1);
		y = pixel(2, 1);
		float_x=x-floor(x); 
        float_y=y-floor(y);
		if (x <= c) && (y <= r) && (x >= 1) && (y >= 1)
			pix_up_left=[floor(x) floor(y)];
           	pix_up_right=[floor(x) ceil(y)];
            pix_down_left=[ceil(x) floor(y)];
            pix_down_right=[ceil(x) ceil(y)];
            value_up_left=(1-float_x)*(1-float_y);
            value_up_right=(1-float_x)*float_y;
           	value_down_left=float_x*(1-float_y);
            value_down_right=float_x*float_y;
			output(i, j) =	value_up_left*source(pix_up_left(1,2), pix_up_left(1,1), 1)+ ...
                                    value_up_right*source(pix_up_right(1,2), pix_up_right(1,1), 1)+ ...
                                    value_down_left*source(pix_down_left(1,2), pix_down_left(1,1), 1)+ ...
                                    value_down_right*source(pix_down_right(1,2), pix_down_right(1,1), 1);
		end
	end
end

close all;
figure();
subplot(1, 2, 1);
imshow(source);
title("原始图像");

subplot(1, 2, 2);
imshow(uint8(output));
title("修复图像");

