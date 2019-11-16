function F=float_X_theat_180(A,B,H,theta,c)

    d=tan(theta)^2+4*A*c;
    xmin=-sqrt(H/A);%左极限点x
    xL=(H-c)/tan(theta);%左交点x
    xR=(tan(theta)+sqrt(d))/(2*A);%右交点x
    xmax=sqrt(H/A);%右极限点x
    cof=4/(3*sqrt(B));
    fun1=@(x) (tan(theta)*x+c-A*x.^2).^1.5;
    v1=quadv(fun1,xL,xR);v1=v1*cof;
    fun2=@(x) (H-A*x.^2).^1.5;
    v2=quadv(fun2,xmin,xL);v2=v2*cof;
    v=quadv(fun2,xmin,xmax);v=v*cof;
    volumn=v-v1-v2;
    %小v为体积，大V是关于x的体积积分
    Fun1=@(x) x.*(tan(theta)*x+c-A*x.^2).^1.5;
    V1=quadv(Fun1,xL,xR);V1=V1*cof;
    Fun2=@(x) x.*(H-A*x.^2).^1.5;
    V2=quadv(Fun2,xmin,xL);V2=V2*cof;
    %fprintf("volumn is %f, Vx1 is %f,",volumn,V1);%测试输出
    F=-(V1+V2)/volumn;




%      c=get_intercept_theat_180(A,B,H,V_boat,z);
%      d=(tan(z)^2+4*A*c)^0.5;
%      
%      x_min=(tan(z)-d)/(2*A);
%      x_max=(tan(z)+d)/(2*A);
%      x_l=-(H/A)^0.5;
%      x_r=(H/A)^0.5;
%      %全部的
%      fun1=@(x) (H-A*x^2)^1.5;
%      Vo_1=quadv(fun1,x_min,x_max);
%      Vo_1=Vo_1*4/(3*B^0.5);
%      fun2=@(x) (H-A*x^2)^1.5;
%      Vo_total=quadv(fun2,x_l,x_r);
%      Vo_total=Vo_total*4/(3*B^0.5);
%      Vo_all=Vo_total-Vo_1;
% 
%      %带x的  检查
%      fun3=@(x) x*(H-A*x.^2)^1.5;
%      Vo_3=quadv(fun3,x_min,x_max);
%      Vo_3=Vo_3*4/(3*B^0.5);
%      fun4=@(x) x*(H-A*x.^2)^1.5;
%      Vo_4=quadv(fun4,x_l,x_r);
%      Vo_4=Vo_4*4/(3*B^0.5);
%      Vo_all2=Vo_4-Vo_3;
%      %fprintf("X不带%f  带%f\n  ",Vo_1,Vo_total);
%      F=Vo_all2/Vo_all;
     
     
%     %x轴积分体积区域
%      fun1=@(x) x*2/3*(H-A*x^2)^1.5;
%      Vo_x=quadv(fun1,x_left,x_min);
%      Vo_x=Vo_x*2/B^0.5;
%      
%      fun2=@(x) x*(tan(z)*x+c-A*x^2-(tan(z)*x+c-A*x^2)/3)*sqrt(tan(z)*x+c-A*x^2);
%      Vo_X=quadv(fun2,x_min,x_max);
%      Vo_X=Vo_X*2/B^0.5;
%      Vo_xall=Vo_X+Vo_x;
%      fprintf("X这里的浮心：%f       %f\n",Vo_x,Vo_X);
%     
%     %整体区域 
%     
%      fun1=@(x) 2/3*(H-A*x^2)^1.5;
%      Vo_x1=quadv(fun1,x_left,x_min);
%      Vo_x1=Vo_x1*2/B^0.5;
%      
%      fun2=@(x) (tan(z)*x+c-A*x^2-(tan(z)*x+c-A*x^2)/3)*sqrt(tan(z)*x+c-A*x^2);
%      Vo_x2=quadv(fun2,x_min,x_max);
%      Vo_x2=Vo_x2*2/B^0.5;
%      Vo_x_all=Vo_x1+Vo_x2;
%     
%      F=Vo_xall/Vo_x_all;
end