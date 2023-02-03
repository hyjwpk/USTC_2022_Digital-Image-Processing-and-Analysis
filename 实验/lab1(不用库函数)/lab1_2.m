source = imread('1.bmp');
[r, c, l] = size(source);
output1 = zeros(r, c, l);
output2 = zeros(r, c, l);
theta = 35 / 180.0 * pi ; 
a=r/2;
b=c/2;
opmatrix = [1 0 a; 0 1 b; 0 0 1]*[cos(theta) -sin(theta) 0; sin(theta) cos(theta) 0; 0 0 1]*[1 0 -a; 0 1 -b; 0 0 1];
for i = 1 : r
	for j = 1 : c
		pixel = [i; j; 1];
		pixel = opmatrix \ pixel;
		x = round(pixel(1, 1));
		y = round(pixel(2, 1));
		if (x <= r) && (y <= c) && (x >= 1) && (y >= 1)
			for k = 1 : l
				output1(i, j, k) = source(x, y, k);
			end
		end
	end
end
for i = 1 : r
	for j = 1 : c
		pixel = [i; j; 1];
		pixel = opmatrix \ pixel;
		x = pixel(1, 1);
		y = pixel(2, 1);
		float_x=x-floor(x); 
        float_y=y-floor(y);  
		if (x <= r) && (y <= c) && (x >= 1) && (y >= 1)
			pix_up_left=[floor(x) floor(y)];
           	pix_up_right=[floor(x) ceil(y)];
            pix_down_left=[ceil(x) floor(y)];
            pix_down_right=[ceil(x) ceil(y)];
            value_up_left=(1-float_x)*(1-float_y);
            value_up_right=(1-float_x)*float_y;
           	value_down_left=float_x*(1-float_y);
            value_down_right=float_x*float_y;
			for k = 1 : l
				output2(i, j, k) =	value_up_left*source(pix_up_left(1,1), pix_up_left(1,2), k)+ ...
                                    value_up_right*source(pix_up_right(1,1), pix_up_right(1,2), k)+ ...
                                    value_down_left*source(pix_down_left(1,1), pix_down_left(1,2), k)+ ...
                                    value_down_right*source(pix_down_right(1,1), pix_down_right(1,2), k);
			end
		end
	end
end
subplot(1,2,1); imshow(uint8(output1));
subplot(1,2,2); imshow(uint8(output2));

