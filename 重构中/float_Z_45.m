%/*-----确定积分上下限此处为右下右上积分----*/
%/*-----x的浮心位置坐标直接用积分体积比例表示--*/
%/*-----求出体积质量后直接比总重量----*/
function F=float_Z_45(A,B,H,V_boat,z)
     c=get_intercept_45(A,B,H,V_boat,z);
     d=(tan(z)^2+4*A*c)^0.5;
     x_min=(tan(z)-d)/(2*A);
     x_max=(H-c)/tan(z);
     x_right=(H/A)^0.5;
     
      %左部分
    fun1=@(x) 2/3*(tan(z)*x+c-A*x^2)^1.5;
    Vo_1=quadv(fun1,x_min,x_max);
    Vo_1=Vo_1*2/(B^0.5);
       %右部分
    fun2=@(x) 2/3*(H-A*x^2)^1.5;
    Vo_2=quadv(fun2,x_max,x_right);
    Vo_2=Vo_2*(2/(B^0.5));
    Vo_all=Vo_1+Vo_2;
        
        %左边带Z
    fun3=@(x) ((tan(z)*x+c)^2-(A*x^2)^2-2*A*x^2*((tan(z)*x+c)-A*x^2)-((tan(z)*x+c)-A*x^2)^2/5)*((tan(z)*x+c)-A*x^2)^0.5;
    Vo_3=quadv(fun3,x_min,x_max);
    Vo_3=Vo_3*2/B^0.5;
        %右边带Z
    fun4=@(x) (H^2-(A*x^2)^2-2*A*x^2*(H-A*x^2)-(H-A*x^2)^2/5)*(H-A*x^2)^0.5;
    Vo_4=quadv(fun4,x_max,x_right);
    Vo_4=Vo_4*2/B^0.5;
    Vo_all2=Vo_3+Vo_4;
        %fprintf("带Z的%f   %f\n",Vo_all2,Vo_all);
    F=Vo_all2/Vo_all;
       % fprintf("V体积总：%f   分：%f\n",Vo_all2,Vo_all);
        
%      fun1=@(x) ((tan(z)*x+c)^2-A^2*x^4)*sqrt(tan(z)*x+c-A*x^2)-2*A*x^2*(tan(z)*x+c-A*x^2)^1.5/3-(tan(z)*x+c-A*x^2)^2.5/5;
%      Vo_z1=quadv(fun1,x_min,x_max);
%      Vo_z1=Vo_z1*1/B^0.5;
%      fun2=@(x) (H^2-A^2*x^4)*sqrt(H-A*x^2)-2*A*x^2.*(H-A*x^2)^1.5/3-(H-A*x^2)^2.5/5;
%      Vo_z2=quadv(fun2,x_max,x_right);                  
%      Vo_z2=Vo_z2*(2/(3*B^0.5));
%      Vo_z_all=Vo_z1+Vo_z2;
%      
     %x的上下限
%      fun3=@(x) ((tan(z)*x+c-A*x^2)*sqrt(tan(z)*x+c-A*x^2)-(tan(z)*x+c-A*x^2)^1.5/3);
%      Vo_a=quadv(fun3,x_min,x_max);
%      Vo_a=Vo_a*2/(B^0.5);
%      
%      fun4=@(x) 2/3*(H-A*x^2)^1.5;
%      Vo_a2=quadv(fun4,x_max,x_right);
%      Vo_a2=Vo_a2*(4/(3*B^0.5));
%      Vo_all=Vo_a+Vo_a2;
%      F=Vo_z_all/Vo_all;
   
end