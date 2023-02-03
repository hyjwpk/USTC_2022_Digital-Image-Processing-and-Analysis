source = imread('lena.bmp');
[r,l] = size(source);
output = zeros(r,l);
x1 = input("x1:");
y1 = input("y1:");
x2 = input("x2:");
y2 = input("y2:");
for i = 1 : r
    for j = 1 : l
        output(i,j) = f(source(i,j),x1,y1,x2,y2);%进行线性映射
    end
end
subplot(1,2,1); imshow(source); title('原图'); 
subplot(1,2,2); imshow(uint8(output)); title('灰度拉伸后'); 

function [fx] = f(x,x1,y1,x2,y2)%灰度拉伸函数
    if(x < x1)
        fx = y1 / x1 * x;
    else
        if(x <= x2)
            fx = (y2 - y1)/(x2 - x1)*(x - x1) + y1;
        else
                fx = (255 - y2)/(255 - x2)*(x - x2) + y2;
        end
    end  
end