source = imread('alphabet2.jpg');
[r, c, l] = size(source);
output1 = zeros(224, 224, l);
output2 = zeros(224, 224, l);
x1=1;
y1=1;
u1=1;
v1=1;
x2=224;
y2=1;
u2=224;
v2=1;
x3=1;
y3=224;
u3=1;
v3=224;
x4=245;
y4=266;
u4=224;
v4=224;
A=[x1 y1 1 0 0 0 -x1*u1 -y1*u1;
 0 0 0 x1 y1 1 -x1*v1 -y1*v1;
x2 y2 1 0 0 0 -x2*u2 -y2*u2;
 0 0 0 x2 y2 1 -x2*v2 -y2*v2;
x3 y3 1 0 0 0 -x3*u3 -y3*u3;
 0 0 0 x3 y3 1 -x3*v3 -y3*v3;
x4 y4 1 0 0 0 -x4*u4 -y4*u4;
 0 0 0 x4 y4 1 -x4*v4 -y4*v4];
B=[u1;v1;u2;v2;u3;v3;u4;v4];
M=A\B;
opmatrix = [M(1,1) M(2,1) M(3,1); M(4,1) M(5,1) M(6,1); M(7,1) M(8,1) 1];
invopmatrix = inv(opmatrix);
for i = 1 : 224
	for j = 1 : 224
        w = 1/(invopmatrix(3,1)*j+invopmatrix(3,2)*i+1);
		pixel = [w*j; w*i; w];
		pixel = opmatrix \ pixel;
		x = round(pixel(1, 1));
		y = round(pixel(2, 1));
		if (x <= c) && (y <= r) && (x >= 1) && (y >= 1)
			for k = 1 : l
				output1(i, j, k) = source(y, x, k);
			end
		end
	end
end
for i = 1 : 224
	for j = 1 : 224
        w = 1/(invopmatrix(3,1)*j+invopmatrix(3,2)*i+1);
		pixel = [w*j; w*i; w];
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
				output2(i, j, k) =	value_up_left*source(pix_up_left(1,2), pix_up_left(1,1), k)+ ...
                                    value_up_right*source(pix_up_right(1,2), pix_up_right(1,1), k)+ ...
                                    value_down_left*source(pix_down_left(1,2), pix_down_left(1,1), k)+ ...
                                    value_down_right*source(pix_down_right(1,2), pix_down_right(1,1), k);
			end
		end
	end
end
output2(1,:,:)=[];
output2(:,1,:)=[];
subplot(1,2,1); imshow(uint8(output1));
subplot(1,2,2); imshow(uint8(output2));