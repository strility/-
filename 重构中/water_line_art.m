function F=water_line_art(A,B,H,water_line)
water_line=water_line*1000;
fsurf(@(x,y) A*x.^2+B*y.^2);
zlim([0 H*1000]);
hold on;
fsurf(water_line);
F=1;
end