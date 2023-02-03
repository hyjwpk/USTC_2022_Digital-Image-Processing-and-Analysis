source = imread('pout.bmp');
subplot(3,2,1); imshow(source); title('原图'); 
subplot(3,2,2); histogram(source);title('原图直方图');
output1 = histeq(source);%直方图均衡
subplot(3,2,3); imshow(output1);title('直方图均衡');
subplot(3,2,4); histogram(output1);title('增强后直方图');
output2 = histeq(source,normpdf((0:1:255),127,40));%使用均值127，标准差40的高斯函数进行规定化
subplot(3,2,5); imshow(output2);title('直方图规定化');
subplot(3,2,6); histogram(output2);title('规定化后直方图');