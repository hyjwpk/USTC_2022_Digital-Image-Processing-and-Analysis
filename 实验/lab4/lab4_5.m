source = imread('Pout.bmp');
D = 15;
n = 1;
a = 4;
b = 1;
subplot(2,4,1); imshow(source,[]); title('Pout'); 
subplot(2,4,2); imshow(histeq(uint8(ILPF(source,D,a,b)))); title('Pout理想高频-直方图'); 
subplot(2,4,3); imshow(histeq(uint8(BLPF(source,D,n,a,b)))); title('Pout巴特沃斯高频-直方图'); 
subplot(2,4,4); imshow(histeq(uint8(ELPF(source,D,n,a,b)))); title('Pout高斯高频-直方图');
subplot(2,4,6); imshow(ILPF(histeq(source),D,a,b),[]); title('Pout直方图-理想高频'); 
subplot(2,4,7); imshow(BLPF(histeq(source),D,n,a,b),[]); title('Pout直方图-巴特沃斯高频'); 
subplot(2,4,8); imshow(ELPF(histeq(source),D,n,a,b),[]); title('Pout直方图-高斯高频');

%理想高频滤波器
function output = ILPF(input,D0,a,b)
    [r,l] = size(input);
    F = fftshift(fft2(input));%傅里叶变换并平移
    [U,V] = meshgrid(-l/2:l/2-1,-r/2:r/2-1);%构建坐标
    D = hypot(U,V);%计算中心偏移距离
    H = D > D0 ;
    H = a * H + b;
    output = abs(ifft2(ifftshift(F.*H)));%卷积逆变换
end

%巴特沃斯高频滤波器
function output = BLPF(input,D0,n,a,b)
    [r,l] = size(input);
    F = fftshift(fft2(input));%傅里叶变换并平移
    [U,V] = meshgrid(-l/2:l/2-1,-r/2:r/2-1);%构建坐标
    D = hypot(U,V);%计算中心偏移距离
    H = 1./(1+((D0./D).^(2*n)));
    H = a * H + b;
    output = abs(ifft2(ifftshift(F.*H)));%卷积逆变换
end

%高斯高频滤波器
function output = ELPF(input,D0,n,a,b)
    [r,l] = size(input);
    F = fftshift(fft2(input));%傅里叶变换并平移
    [U,V] = meshgrid(-l/2:l/2-1,-r/2:r/2-1);%构建坐标
    D = hypot(U,V);%计算中心偏移距离
    H = exp((-D0./D).^n);
    H = a * H + b;
    output = abs(ifft2(ifftshift(F.*H)));%卷积逆变换
end

