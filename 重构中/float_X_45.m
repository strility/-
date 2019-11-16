%/*-----确定积分上下限此处为右下积分----*/
%/*-----x的浮心位置坐标直接用积分体积比例表示--*/
%/*-----求出体积质量后直接比总重量----*/
function F=float_X_45(A,B,H,V_boat,z)
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
        
     %左部分
    fun3=@(x) x*2/3*(tan(z)*x+c-A*x^2)^1.5;
    Vo_3=quadv(fun3,x_min,x_max);
    Vo_3=Vo_3*2/(B^0.5);
       %右部分
    fun4=@(x) x*2/3*(H-A*x^2)^1.5;
    Vo_4=quadv(fun4,x_max,x_right);
    Vo_4=Vo_4*(2/(B^0.5));
    Vo_all2=Vo_3+Vo_4;
    % fprintf("带X的%f   %f\n",Vo_all2,Vo_all);
    F=Vo_all2/Vo_all;
    
   
    
%     %x轴积分体积区域
%     fun1=@(x) x*((tan(z)*x+c-A*x^2)*sqrt(tan(z)+c-A*x^2)-(tan(z)+c-A*x^2)^1.5/3);
%     Vo_1_x=quadv(fun1,x_min,x_max);
%     Vo_1_x=Vo_1_x*2/(B^0.5);
%     fun2=@(x) x*(H-A*x^2)^1.5;
%     Vo_2_x=quadv(fun2,x_max,x_right);
%     Vo_2_x=Vo_2_x*(4/(3*B^0.5));
%     Vo_all_x=Vo_1_x+Vo_2_x;
%     
%     %整体区域
%     fun_a1=@(x) ((tan(z)*x+c-A*x^2)*sqrt(tan(z)+c-A*x^2)-(tan(z)+c-A*x^2)^1.5/3);
%     Vo_x=quadv(fun_a1,x_min,x_max);
%     Vo_x=Vo_x*2/(B^0.5);
%     fun_a2=@(x) (H-A*x^2)^1.5;
%     Vo_a2=quadv(fun_a2,x_max,x_right);
%     Vo_a2=Vo_a2*(4/(3*B^0.5));
%     Vo_all=Vo_x+Vo_a2;
%     F=Vo_all_x/Vo_all;
%     fprintf("x的重心位置%f  %f\n",Vo_all_x,Vo_all);
end