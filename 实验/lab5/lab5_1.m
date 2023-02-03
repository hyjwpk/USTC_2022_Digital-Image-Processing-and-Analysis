source = im2double(imread('flower1.jpg'));
psf = fspecial('motion',30,45);%运动模糊滤波器
motion = imfilter(source,psf,'conv','circular');%产生运动模糊
noisy = imnoise(motion,'gauss',0,0.0001);%产生高斯噪声

subplot(2,4,1); imshow(source); title('flower1'); 
subplot(2,4,2); imshow(motion); title('flower1运动模糊'); 
subplot(2,4,3); imshow(deconvwnr(motion,psf)); title('flower1运动模糊逆滤波'); 
subplot(2,4,4); imshow(deconvwnr(motion,psf)); title('flower1运动模糊维纳滤波'); 
subplot(2,4,6); imshow(noisy); title('flower1运动模糊&高斯噪声'); 
subplot(2,4,7); imshow(deconvwnr(noisy,psf)); title('flower1运动模糊&高斯噪声逆滤波'); 
subplot(2,4,8); imshow(deconvwnr(noisy,psf,0.0001/var(motion(:)))); title('flower1运动模糊&高斯噪声维纳滤波'); 