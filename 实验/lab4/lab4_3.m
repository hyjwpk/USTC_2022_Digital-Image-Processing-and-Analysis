source1 = imread('Pout.bmp');
source2 = imread('Girl.bmp');
%添加噪声
source1_pepper = imnoise(source1,'salt & pepper',0.03);
source1_gaussian = imnoise(source1,'gaussian');
source2_pepper = imnoise(source2,'salt & pepper',0.03);
source2_gaussian = imnoise(source2,'gaussian');

figure();
subplot(3,3,1); imshow(source1,[]); title('Pout'); 
subplot(3,3,2); imshow(source1_pepper,[]); title('Pout-椒盐噪声'); 
subplot(3,3,3); imshow(source1_gaussian,[]); title('Pout-高斯噪声'); 
subplot(3,3,4); imshow(ILPF(source1_pepper,35),[]); title('Pout-椒盐噪声理想低通滤波器'); 
subplot(3,3,5); imshow(BLPF(source1_pepper,35,1),[]); title('Pout-椒盐噪声巴特沃斯低通滤波器'); 
subplot(3,3,6); imshow(ELPF(source1_pepper,35,2),[]); title('Pout-椒盐噪声高斯低通滤波器');
subplot(3,3,7); imshow(ILPF(source1_gaussian,35),[]); title('Pout-高斯噪声理想低通滤波器'); 
subplot(3,3,8); imshow(BLPF(source1_gaussian,35,1),[]); title('Pout-高斯噪声巴特沃斯低通滤波器'); 
subplot(3,3,9); imshow(ELPF(source1_gaussian,35,2),[]); title('Pout-高斯噪声高斯低通滤波器');

figure();
subplot(3,3,1); imshow(source2,[]); title('Girl'); 
subplot(3,3,2); imshow(source2_pepper,[]); title('Girl-椒盐噪声'); 
subplot(3,3,3); imshow(source2_gaussian,[]); title('Girl-高斯噪声'); 
subplot(3,3,4); imshow(ILPF(source2_pepper,35),[]); title('Girl-椒盐噪声理想低通滤波器'); 
subplot(3,3,5); imshow(BLPF(source2_pepper,35,1),[]); title('Girl-椒盐噪声巴特沃斯低通滤波器'); 
subplot(3,3,6); imshow(ELPF(source2_pepper,35,1),[]); title('Girl-椒盐噪声高斯低通滤波器');
subplot(3,3,7); imshow(ILPF(source2_gaussian,35),[]); title('Girl-高斯噪声理想低通滤波器'); 
subplot(3,3,8); imshow(BLPF(source2_gaussian,35,1),[]); title('Girl-高斯噪声巴特沃斯低通滤波器'); 
subplot(3,3,9); imshow(ELPF(source2_gaussian,35,1),[]); title('Girl-高斯噪声高斯低通滤波器');

%理想低通滤波器
function output = ILPF(input,D0)
    [r,l] = size(input);
    F = fftshift(fft2(input));%傅里叶变换并平移
    [U,V] = meshgrid(-l/2:l/2-1,-r/2:r/2-1);%构建坐标
    D = hypot(U,V);%计算中心偏移距离
    H = D <= D0 ;
    output = abs(ifft2(ifftshift(F.*H)));%卷积逆变换
end

%巴特沃斯低通滤波器
function output = BLPF(input,D0,n)
    [r,l] = size(input);
    F = fftshift(fft2(input));%傅里叶变换并平移
    [U,V] = meshgrid(-l/2:l/2-1,-r/2:r/2-1);%构建坐标
    D = hypot(U,V);%计算中心偏移距离
    H = 1./(1+((D./D0).^(2*n)));
    output = abs(ifft2(ifftshift(F.*H)));%卷积逆变换
end

%高斯低通滤波器
function output = ELPF(input,D0,n)
    [r,l] = size(input);
    F = fftshift(fft2(input));%傅里叶变换并平移
    [U,V] = meshgrid(-l/2:l/2-1,-r/2:r/2-1);%构建坐标
    D = hypot(U,V);%计算中心偏移距离
    H = exp(-(D./D0).^n);
    output = abs(ifft2(ifftshift(F.*H)));%卷积逆变换
end
