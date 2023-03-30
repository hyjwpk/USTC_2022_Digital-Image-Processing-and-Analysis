source1 = imread('Rect1.bmp');
source2 = imread('Rect2.bmp');
%傅里叶变换
F1 = fft2(source1);
F2 = fft2(source2);
%移动低频至中心并增强
F1_shift = log(abs(fftshift(F1))+1);
F2_shift = log(abs(fftshift(F2))+1);
%幅度逆变换
IF1_abs = uint8(ifft2(abs(F1)));
IF2_abs = uint8(ifft2(abs(F2)));
%相位逆变换
IF1_angle = uint8(abs(ifft2(10000*exp(1i*angle(F1)))));
IF2_angle = uint8(abs(ifft2(10000*exp(1i*angle(F2)))));
%共轭逆变换
IF1_conj = ifft2(conj(F1));
IF2_conj = ifft2(conj(F2));
subplot(2,5,1); imshow(source1); title('rect1'); 
subplot(2,5,2); imshow(F1_shift,[]); title('rect1幅度谱'); 
subplot(2,5,3); imshow(IF1_abs); title('rect1幅度逆变换'); 
subplot(2,5,4); imshow(IF1_angle); title('rect1相位逆变换');
subplot(2,5,5); imshow(IF1_conj,[]); title('rect1傅里叶变换共轭逆变换');
subplot(2,5,6); imshow(source2); title('rect2'); 
subplot(2,5,7); imshow(F2_shift,[]); title('rect2幅度谱');
subplot(2,5,8); imshow(IF2_abs); title('rect2幅度逆变换'); 
subplot(2,5,9); imshow(IF2_angle); title('rect2相位逆变换'); 
subplot(2,5,10); imshow(IF2_conj,[]); title('rect2傅里叶变换共轭逆变换');
