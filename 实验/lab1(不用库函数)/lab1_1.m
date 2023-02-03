source = imread('1.jpg');
[r, c, l] = size(source);
output = zeros(r, c, l); 
tx = 100;
ty = 50;
opmatrix = [1 0 tx; 0 1 ty; 0 0 1];
for i = 1 : r
	for j = 1 : c
		pixel = [i; j; 1];
		pixel = opmatrix * pixel;
		x = pixel(1, 1);
		y = pixel(2, 1);
		if (x <= r) && (y <= c) && (x >= 1) && (y >= 1)
			for k = 1 : l
				output(x, y, k) = source(i, j, k);
			end
		end
	end
end
subplot(1,2,1); imshow(source);
subplot(1,2,2); imshow(uint8(output));