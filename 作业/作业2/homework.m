x = imread('lena.bmp');%需要过滤的图像
n = 3;
[r, c] = size(x);
x = imnoise(x,'salt & pepper');
y = x;
for i = 1 : r - (n - 1)  
    for j = 1: c - (n - 1)  
        y(i + (n - 1) / 2,j + (n - 1) / 2)=median(x(i : i + (n - 1),j:j + (n - 1)),'all'); 
    end  
end 
subplot(1,2,1); imshow(x);
subplot(1,2,2); imshow(uint8(y));


