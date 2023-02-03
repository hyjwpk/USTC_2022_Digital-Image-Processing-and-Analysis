source = imread('lena.bmp');
subplot(1,3,1); imshow(source); title('lena'); 
subplot(1,3,2); imshow(imbinarize(source, OSTU(source))); title('分割二值化结果'); 
subplot(1,3,3); imshow(imbinarize(source, graythresh(source))); title('分割二值化结果'); 

function T = OSTU(input)
    [r, l] = size(input);
    N = r * l;%获得像素点数
    miu = zeros(257);%均值累计矩阵
    w = zeros(257);%概率累计矩阵
    for i = 0 : 255
        p = length(find(input == i)) / N;%像素为i的像素所占比例
        miu(i+2) = miu(i+1) + p * i;
        w(i+2) = w(i+1) + p;
    end
    g = (w./(1-w)).*(miu./w-miu(257)).^2;
    T = (find(g==max(g))- 2)/255;
end