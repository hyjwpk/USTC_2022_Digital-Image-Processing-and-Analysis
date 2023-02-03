source = imread('lena.bmp');
%添加噪声
pepper = imnoise(source,'salt & pepper',0.03);
gaussian = imnoise(source,'gaussian');
random = Random(source);
%中值滤波
pepper_output = medfilt2(pepper);
gaussian_output = medfilt2(gaussian);
speckle_output = medfilt2(random);
subplot(2,4,1); imshow(source); title('原图'); 
subplot(2,4,2); imshow(pepper); title('3%椒盐噪声'); 
subplot(2,4,3); imshow(gaussian); title('高斯噪声'); 
subplot(2,4,4); imshow(random); title('随机噪声'); 
subplot(2,4,6); imshow(pepper_output); title('3%椒盐噪声中值滤波'); 
subplot(2,4,7); imshow(gaussian_output); title('高斯噪声中值滤波'); 
subplot(2,4,8); imshow(speckle_output); title('随机噪声中值滤波'); 

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