source = imread('lena.bmp');
min = input("下限:");
max = input("上限:");
histogram(source,'BinLimits',[min,max])%显示给定范围的灰度直方图