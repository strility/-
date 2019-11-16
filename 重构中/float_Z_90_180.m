%/*-----确定积分上下限此处为右下积分和右上----*/
%/*-----x的浮心位置坐标直接用积分体积比例表示--*/
%/*-----求出体积质量后直接比总重量----*/
function F=float_Z_90_180(A,B,H,V_boat,z)
     c=get_intercept_90_180(A,B,H,V_boat,z);
     d=(tan(z)^2+4*A*c)^0.5;
     x_min=(H-c)/tan(z);
     x_max=(tan(z)+d)/(2*A);
     x_r=(H/A)^0.5;
     x_l=-(H/A)^0.5;
     
     fun1=@(x) (H-tan(z)+c)*(tan(z)+c-A*x^2)^0.5;
     Vo_1=quadv(fun1,x_min,x_max);
     Vo_1=Vo_1*4/(3*B^0.5);
     fun2=@(x) (H-A*x^2-(H-A*x^2)/3)*(H-A*x^2)^0.5;
     Vo_2=quadv(fun2,x_l,x_min);
     Vo_2=Vo_2*2/B^0.5;
     Vo_all=Vo_1+Vo_2;
     Vo_total=quadv(fun2,x_l,x_r);
     Vo_total=Vo_total*2/(1*B^0.5);
     Vo_all=Vo_total-Vo_all;
     
     fun3=@(x) (H^2-A^2*x^4-2*A*x^2*(H-A*x^2)/3-(H-A*x^2)^2/5)*(H-A*x^2)^0.5;
     Vo_3=quadv(fun3,x_min,x_max);
     Vo_3=Vo_3/B^0.5;
     fun4=@(x) (H^2-A^2*x^4)*sqrt(H-A*x^2)-2*A*x^2*(H-A*x^2)^1.5/3-(H-A*x^2)^2.5/5;
     Vo_4=quadv(fun4,x_l,x_min);
     Vo_4=Vo_4*2/(1*B^0.5);
     Vo_Z=quadv(fun4,x_l,x_r);
     Vo_Z=Vo_Z*(2/(1*B^0.5));
     Vo_all2=Vo_3+Vo_4;
     Vo_all2=Vo_Z-Vo_all2;
     %fprintf("不带%f  带%f\n",Vo_all,Vo_all2);
     F=Vo_all2/Vo_all;
%      fun1=@(x) 2/3*(H-A*x^2)^1.5;
%      Vo_z1=quadv(fun1,x_left,x_min);
%      Vo_z1=Vo_z1*2/B^0.5;
%      
%      fun2=@(x) (tan(z)*x+c-A*x^2-(tan(z)*x+c-A*x^2)/3)*sqrt(tan(z)*x+c-A*x^2);
%      Vo_z2=quadv(fun2,x_min,x_max);
%      Vo_z2=Vo_z2*2/B^0.5;
%      Vo_z_all=Vo_z1+Vo_z2;
%      
%      fun3=@(x)(H^2-A^2*x^4-(H-A*x^2)^2/5)*(H-A*x^2)^0.5;
%      Vo_a=quadv(fun3,x_left,x_min);
%      Vo_a=Vo_a*1/(B^0.5);
%      
%      fun4=@(x) ((tan(z)+c)^2-A*x^2*x^4-2/3*A*x^2*(tan(z)*x+c-A*x^2)-(tan(z)*x+c-A*x^2)^2/5)*(tan(z)*x+c-A*x^2)^0.5;
%      Vo_a2=quadv(fun4,x_min,x_max);
%      Vo_a2=Vo_a2*1/(B^0.5);
%      Vo_all=Vo_a+Vo_a2;
%      fprintf("Z这里的浮心：%f       %f\n",Vo_a,Vo_a2);
%      
%      F=Vo_all/Vo_z_all;
end