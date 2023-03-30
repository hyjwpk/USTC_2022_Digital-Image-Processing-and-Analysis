# 第三次作业

## 4.1证明式 $f(x,y)exp[j2\pi(u_0x+v_0y)/N]\Leftrightarrow F(u-u_0,v-v_0)$ 和 $f(x-x_0,y-y_0)\Leftrightarrow F(u,v)exp[-j2\pi(ux_0+vy_0)/N]$ 成立

已知二维离散傅里叶变换公式

$$
F(u,v)=\frac{1}{N}\sum_{x=0}^{N-1}\sum_{y=0}^{N-1}  f(x,y)exp[-j2\pi(ux+vy)/N]
$$

则

$$
\begin{align} 
  F(u-u_0,v-v_0) & = \frac{1}{N}\sum_{x = 0}^{N-1}\sum_{y = 0}^{N-1}  f(x,y)exp[-j2\pi((u-u_0)x+(v-v_0)y)/N]\\
& = \frac{1}{N}\sum_{x = 0}^{N-1}\sum_{y = 0}^{N-1}  f(x,y)exp[j2\pi(u_0x+v_0y)/N]exp[-j2\pi(ux+vy)/N]
\end{align}
$$

可知 $f(x,y)exp[j2\pi(u_0x+v_0y)/N]\Leftrightarrow F(u-u_0,v-v_0)$ 

逆变换为

$$
f(x,y)=\frac{1}{N}\sum_{u=0}^{N-1}\sum_{v=0}^{N-1}  F(u,v)exp[j2\pi(ux+vy)/N]
$$

则

$$
\begin{align} 
  f(x-x_0,y-y_0)&=\frac{1}{N}\sum_{u=0}^{N-1}\sum_{v=0}^{N-1}  F(u,v)exp[j2\pi(u(x-x_0)+v(y-y_0))/N]\\
&=\frac{1}{N}\sum_{u=0}^{N-1}\sum_{v=0}^{N-1}  F(u,v)exp[-j2\pi(ux_0+vy_0)/N]exp[j2\pi(ux+vy)/N]
\end{align}
$$

可知 $f(x-x_0,y-y_0)\Leftrightarrow F(u,v)exp[-j2\pi(ux_0+vy_0)/N]$ 

## 4.2证明 $f(x)$ 的自相关函数的傅里叶变换就是 $f(x)$$的功率谱 $|F(u)|^2$ 

$f(x)$ 的自相关函数为

$$
f(x)\circ f(x)=\int_{-\infty }^{\infty } f^*(\tau )f(x+\tau)d\tau
$$

其傅里叶变换为

$$
\begin{align} 
  \int_{-\infty }^{\infty } (f(x)\circ f(x))exp[-j2\pi ux]dx &=\int_{-\infty }^{\infty }[\int_{-\infty }^{\infty } f^*(\tau )f(x+\tau)d\tau] exp[-j2\pi ux]dx\\
&=\int_{-\infty }^{\infty }f^\*(\tau )[\int_{-\infty }^{\infty } f(x+\tau)exp[-j2\pi u(x+\tau)]dx] exp[j2\pi u\tau]d\tau\\
&=F(u)\int_{-\infty }^{\infty }f^\*(\tau )exp[j2\pi u\tau]d\tau\\
&=F(u)(\int_{-\infty }^{\infty }f(\tau )exp[-j2\pi u\tau]d\tau)^\*\\
&=F(u)F^\*(u)\\
&=|F(u)|^2
\end{align}
$$

## 4.3证明离散傅里叶变换和反变换都是周期函数（为简便可以用1-D函数为例）。

1-D离散傅里叶变换公式为

$$
F(u)=\frac{1}{N}\sum_{x=0}^{N-1} f(x)exp[-j2\pi ux/N]
$$

则

$$
\begin{align} 
  F(u+N)&=\frac{1}{N}\sum_{x=0}^{N-1} f(x)exp[-j2\pi (u+N)x/N]\\
&=\frac{1}{N}\sum_{x=0}^{N-1} f(x)exp[-j2\pi ux/N]exp[-j2\pi x]\\
&=\frac{1}{N}\sum_{x=0}^{N-1} f(x)exp[-j2\pi ux/N]\\
&=F(u)
\end{align}
$$

1-D离散傅里叶逆变换公式为

$$
f(x)=\sum_{u=0}^{N-1}F(u)exp[j2\pi ux/N]
$$

则

$$
\begin{align}
f(x+N)&=\sum_{u=0}^{N-1}F(u)exp[j2\pi u(x+N)/N]\\
&=\sum_{u=0}^{N-1}F(u)exp[j2\pi ux/N]exp[j2\pi u]\\
&=\sum_{u=0}^{N-1}F(u)exp[j2\pi ux/N]\\
&=f(x)
\end{align}
$$
