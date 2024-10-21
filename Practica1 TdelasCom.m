close all
clear all
clc
%Graficar a)
t = -0.07 : 1/1000 : 0.07;
%x1 = 100*tripuls(t,0.12,0);
x1=((100/0.06).*t+100).*((t>-0.06)&(t<0))+((-100/0.06).*t+100).*((t<0.06)&(t>=0));
figure
subplot(2,1,1);
plot(t,x1)
axis([-0.07 0.07 -0.2 100])
xlabel("t",'Interpreter','latex')
ylabel("f(t)",'Interpreter','latex')
title("Pulso Triangular/Se\~{n}al modulante",'Interpreter','latex')

%Grafica b)
fs = 1000;
N=500;
w = (( -N/2 : (N/2)-1) * fs/N);
Fw = fftshift(abs(fft(x1, N)));
Fw2=(2*pi.* Fw)/(6001);
subplot(2,1,2);
plot(w,Fw2);
xlabel("w",'Interpreter','latex')
ylabel("F(w)",'Interpreter','latex')
title("Espectro de la se\~{n}al modulante",'Interpreter','latex')


%Grafica c)
xc=cos(200.*pi.*t);
figure
subplot(2,1,1);
plot(t,xc)
xlabel("t",'Interpreter','latex')
ylabel("Xc(t)",'Interpreter','latex')
title("Cos(100*pi*t)/Se\~{n}al portadora",'Interpreter','latex')

%Grafica d)
Xcw = fftshift(abs(fft(xc, N)));
Xcw2=(2*pi.* Xcw)/(142);
subplot(2,1,2);
plot(w,Xcw2);
xlabel("w",'Interpreter','latex')
ylabel("Xc(w)",'Interpreter','latex')
title("Espectro de la se\~{n}al potadora",'Interpreter','latex')

%Grafica e)
s=x1.*xc;
figure
subplot(2,1,1);
plot(t,s)
xlabel("t",'Interpreter','latex')
ylabel("F(t)*Xc(t)",'Interpreter','latex')
title("F(t)Xc(t)",'Interpreter','latex')

%Grafica f)
Sw = fftshift(abs(fft(s, N)));
Sw2=(2*pi.* Sw)/(fs);
subplot(2,1,2);
plot(w,Sw2);
xlabel("w(rad/seg)",'Interpreter','latex')
ylabel("Magnitud",'Interpreter','latex')
title("Espectro de la se\~{n}al multiplicada  (M(w)Xc(w))",'Interpreter','latex')