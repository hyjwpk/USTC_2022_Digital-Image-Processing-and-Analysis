# 第五次作业

## 1．设一幅图像的模糊是由物体在x和y方向上任意的匀速运动产生的，求转移函数H(u，v)。

设 $x_0(t)=at/T,y_0(t)=bt/T$ 为物体在x和y方向上的任意匀速运动，则转移函数 $H(u,v)$ 如下

$$
\begin{align}
H(u,v) & = \int_{0}^{T} e^{-j2\pi (ux_0(t)+vy_0(t))}dt\\
& = \int_{0}^{T} e^{\frac{-j2\pi (ua+vb)}{T}t }dt\\
& = \frac{T}{j2\pi (ua+vb)}\int_{0}^{j2\pi (ua+vb)} e^{-x}dx\\
& = \frac{T}{j2\pi (ua+vb)}(1-e^{j2\pi (ua+vb)})
\end{align}
$$

## 2.设一幅图像的模糊是由物体在x方向的匀加速运动产生的，当t＝0时，物体静止，在t＝0到t＝T间物体加速度 $x_0(t)=at^2/2$ ，求转移函数H(u，v)，并讨论匀速运动和匀加速运动所造成的模糊的不同特点。

转移函数 $H(u,v)$ 如下

$$
\begin{align}
H(u,v) & = \int_{0}^{T} e^{-j2\pi ux_0(t)}dt\\
& = \int_{0}^{T} e^{-j\pi uat^2 }dt\\
& = \int_{0}^{T} [cos(\pi uat^2)-jsin(\pi uat^2)]dt\\
& = \sqrt{\frac{1}{\pi ua}} \int_{0}^{\sqrt{\pi ua}T} [cos(x^2)-jsin(x^2)]dx
\end{align}
$$

匀速运动在运动方向各处产生的模糊程度是相同的，匀加速运动随着t的增大，物体的运动速度增大，在运动方向上模糊程度逐渐增强，同时匀速运动的转移函数 $H(u,v)= \frac{T}{j2\pi (ua+vb)}(1-e^{j2\pi (ua+vb)})$ 有零点，而匀加速运动的转移函数 $H(u,v)= \sqrt{\frac{1}{\pi ua}} \int_{0}^{\sqrt{\pi ua}T} [cos(x^2)-jsin(x^2)]dx$ 无零点，可直接使用其倒数进行逆滤波

## 3.成像时由于长时间曝光受到大气干扰而产生的图像模糊可以用/转移函数 $H(u，v)＝exp[-(u^2+v^2)/2{\sigma}^2]$ 表示。设噪声可忽略，求恢复这类模糊的维纳滤波的方程。

在忽略噪声时，维纳滤波退化为逆滤波，则恢复这类模糊的维纳滤波的方程如下

$$
\begin{align}
\hat{F}(u,v) & = \frac{1}{H(u,v)}G(u,v) \\
& = exp[(u^2+v^2)/2{\sigma}^2]G(u,v)
\end{align}
$$
