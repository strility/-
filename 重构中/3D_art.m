%��άͼ
colormap(hsv) ;
t=-0.5:0.04:0.5;
A=10;
B=6;
H=0.15;
[x,y] =meshgrid(t);
z=A*x.^4+B*y.^2;
surf(x,y,z);
hold on;



colormap(cool) ;
[X,Y] =meshgrid(t);
Z=-Y*tand(20)+0.05;%�õ��ĽǶȺ�c
surf(X,Y,Z);
xlabel('X');
ylabel('Y');
zlabel('Z');
title('surf��ά����ͼ');
axis([-0.5 0.5 -0.5 0.5 0 H]);
