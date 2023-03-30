source = imread('alphabet2.jpg');
origin = imread('alphabet1.jpg');
subplot(1,2,1); imshow(source);
subplot(1,2,2); imshow(origin);
[x, y] = ginput(8);%获得几何失真图像与原图一一对应的四组控制点对
movingPoints = [x(1) y(1);x(3) y(3);x(5) y(5);x(7) y(7)];%几何失真图像控制点
fixedPoints = [x(2) y(2);x(4) y(4);x(6) y(6);x(8) y(8)];%原图控制点
tform = fitgeotrans(movingPoints,fixedPoints,'projective');%对几何变换拟合
output1 = imwarp(source,tform,'nearest');%nearest为最近邻插值
output2 = imwarp(source,tform,'bilinear');%bilinear为双线性插值
subplot(1,2,1); imshow(output1);title('最近邻插值');
subplot(1,2,2); imshow(output2);title('双线性插值');