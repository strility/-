%2Dͼ
clear;
x=-0.2:0.01:0.2;
A=10;
H=0.12;
y=A*x.^2;
plot(x,y);
hold on;
plot([-0.2 0.2],[0.4 0.4])
y=x*tand(66)+ 0.1;
plot(x,y)
axis equal;
axis([-0.5 0.5 0 0.5]);
