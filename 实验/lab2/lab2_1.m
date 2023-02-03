source = imread('lena.bmp');
[r,l] = size(source);
output = zeros(r,l);
fa = input("斜率:");
fb = input("截距:");
for i = 1 : r
    for j = 1 : l
        output(i,j) = source(i,j)*fa+fb;%进行线性映射
    end
end
subplot(1,2,1); imshow(source); title('原图'); 
subplot(1,2,2); imshow(uint8(output)); title('线性变换后'); 