source = imread('lena.bmp');
tx = input("水平平移量:");
ty = input("垂直平移量:");
output = imtranslate(source,[tx,ty]);
subplot(1,2,1); imshow(source); title('原图'); 
subplot(1,2,2); imshow(output); title('平移后'); 