source1 = imread('Pout.bmp');
source2 = imread('Girl.bmp');
D = 35;
subplot(2,4,1); imshow(source1,[]); title('Pout'); 
subplot(2,4,2); imshow(ILPF(source1,D),[]); title('Pout理想低通滤波器'); 
subplot(2,4,3); imshow(BLPF(source1,D,1),[]); title('Pout巴特沃斯低通滤波器'); 
subplot(2,4,4); imshow(ELPF(source1,D,2),[]); title('Pout高斯低通滤波器');
subplot(2,4,5); imshow(source2); title('Girl'); 
subplot(2,4,6); imshow(ILPF(source2,D),[]); title('Girl理想低通滤波器');
subplot(2,4,7); imshow(BLPF(source2,D,1),[]); title('Girl巴特沃斯低通滤波器'); 
subplot(2,4,8); imshow(ELPF(source2,D,2),[]); title('Girl高斯低通滤波器'); 

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

