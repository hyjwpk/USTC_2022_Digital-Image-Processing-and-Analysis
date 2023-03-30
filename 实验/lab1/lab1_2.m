source = imread('lena.bmp');
angle = input("旋转角度:");
output1 = imrotate(source,angle,'nearest','crop');%nearest为最近邻插值
output2 = imrotate(source,angle,'bilinear','crop');%bilinear为双线性插值
subplot(1,2,1); imshow(output1);title('最近邻插值');
subplot(1,2,2); imshow(output2);title('双线性插值');