# 第四次作业

## 1.讨论用于空间滤波的平滑滤波器和锐化滤波器的相同点、不同点以及联系。

相同点：平滑滤波器和锐化滤波器都是变换域增强的图像处理方式

不同点：平滑滤波器是采用低通滤波，锐化滤波器是采用高通滤波

联系：平滑滤波器和锐化滤波器相对应，常用的都为

- 1.理想低通（高通）滤波器
- 2.巴特沃斯低通（高通）滤波器
- 3.指数低通（高通）滤波器
- 4.梯形低通（高通）滤波器

## 2.在什么条件下式 $H(u,v)=\frac{1}{1+[D(u,v)/D_0]^{2n}}$ 的巴特沃思低通滤波器变成理想低通滤波器?

当参数 $n\rightarrow \infty$ 时，式 $H(u,v)=\frac{1}{1+[D(u,v)/D_0]^{2n}}$ 的巴特沃思低通滤波器变为式为

$$
H(u,v)=\left\{\begin{matrix}
&1,D(u,v)<  D_0\\
&0,D(u,v)> D_0
\end{matrix}\right.
$$

的理想低通滤波器

## 3.证明可以通过在频域内用原始图减去低通滤波图得到高通滤波的结果。

记频域内原始图为 $F(u,v)$ ，低通滤波器的变换函数为 $H(u,v)$ ，则低通滤波图为 $G(u,v)=F(u,v)H(u,v)$ ，用原始图减去低通滤波图得到 $G^{'}(u,v)=F(u,v)-G(u,v)=F(u,v)(1-H(u,v))=F(u,v)H^{'}(u,v)$ ，则 $H^{'}(u,v)=1-H(u,v)$ 为低通滤波器对应的高通滤波器的变换函数，则 $G^{'}(u,v)$ 即为高通滤波的结果

## 4.从巴特沃思低通滤波器出发推导它对应的高通滤波器。

若巴特沃思低通滤波器为

$$
H(u,v)=\frac{1}{1+[D(u,v)/D_0]^{2n}}
$$

则其对应的高通滤波器为

$$
H(u,v)=1-\frac{1}{1+[D(u,v)/D_0]^{2n}} =\frac{[D(u,v)/D_0]^{2n}}{1+[D(u,v)/D_0]^{2n}}=\frac{1}{1+[D_0/D(u,v)]^{2n}}
$$

## 5.有一种常用的图像增强技术是将高频增强和直方图均衡化结合起来以达到使边缘锐化的反差增强效果，以上两个操作的先后次序对增强效果有影响吗，为什么？

两个操作的先后次序对增强效果有影响，因为高频增强在变换域进行，是非线性变换，直方图均衡化在空间域进行，是线性变换，若先进行高频增强会使图像丢失低频的灰度信息
