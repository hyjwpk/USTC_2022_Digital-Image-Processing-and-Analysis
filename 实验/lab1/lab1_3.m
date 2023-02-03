source = imread('lena.bmp');
[r,l] = size(source);
x = input("水平缩放量:");
y = input("垂直缩放量:");
output1 = imresize(source,[r*y,l*x],'nearest');%nearest为最近邻插值
output2 = imresize(source,[r*y,l*x],'bilinear');%bilinear为双线性插值
subplot(1,2,1); imshow(output1);title('最近邻插值');
subplot(1,2,2); imshow(output2);title('双线性插值');