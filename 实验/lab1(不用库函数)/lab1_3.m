source = imread('1.bmp');
[r, c, l] = size(source);
C = 0.7;
D = 2;
newc = round(c*C);
newr = round(r*D);
output1 = zeros(newr, newc, l);
output2 = zeros(newr, newc, l);
opmatrix = [C 0 0; 0 D 0; 0 0 1];
for i = 1 : newc
	for j = 1 : newr
		pixel = [i; j; 1];
		pixel = opmatrix \ pixel;
		x = round(pixel(1, 1));
		y = round(pixel(2, 1));
		if (x <= c) && (y <= r) && (x >= 1) && (y >= 1)
			for k = 1 : l
				output1(j, i, k) = source(y, x, k);
			end
		end
	end
end
for i = 1 : newc
	for j = 1 : newr
		pixel = [i; j; 1];
		pixel = opmatrix \ pixel;
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
			for k = 1 : l
				output2(j, i, k) =	value_up_left*source(pix_up_left(1,2), pix_up_left(1,1), k)+ ...
                                    value_up_right*source(pix_up_right(1,2), pix_up_right(1,1), k)+ ...
                                    value_down_left*source(pix_down_left(1,2), pix_down_left(1,1), k)+ ...
                                    value_down_right*source(pix_down_right(1,2), pix_down_right(1,1), k);
			end
		end
	end
end
subplot(1,2,1); imshow(uint8(output1));
subplot(1,2,2); imshow(uint8(output2));

