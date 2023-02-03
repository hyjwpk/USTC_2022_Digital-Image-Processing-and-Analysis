source = imread('lena.bmp');
%添加噪声
pepper = imnoise(source,'salt & pepper',0.03);
gaussian = imnoise(source,'gaussian');
random = Random(source);
%超限邻域平均滤波
pepper_output = filter(pepper,35);
gaussian_output = filter(gaussian,35);
poisson_output = filter(random,35);
subplot(2,4,1); imshow(source); title('原图'); 
subplot(2,4,2); imshow(pepper); title('3%椒盐噪声'); 
subplot(2,4,3); imshow(gaussian); title('高斯噪声'); 
subplot(2,4,4); imshow(random); title('随机噪声'); 
subplot(2,4,6); imshow(pepper_output); title('3%椒盐噪声超限邻域平均滤波'); 
subplot(2,4,7); imshow(gaussian_output); title('高斯噪声超限邻域平均滤波'); 
subplot(2,4,8); imshow(poisson_output); title('随机噪声超限邻域平均滤波'); 

function [output] = filter(input,T)
    output = input;
    [r,l] = size(output);
    for i = 2 : (r - 1)
        for j = 2 : (l - 1)
            mean_value = mean(mean(input(i - 1 : i + 1, j - 1 : j + 1)));%计算均值
            if(abs(double(input(i,j)) - mean_value) > T)%超限滤波
                output(i,j) = mean_value;
            end
        end
    end
end

%随机噪声
function [output] = Random(input)
    output = imnoise(input,'salt & pepper',0.03);
    [r,l] = size(output);
    for i = 1 : r
        for j = 1 : l
            if(output(i,j) ~= input(i,j))
                output(i,j) = uint8(rand()*255);
            end
        end
    end
end