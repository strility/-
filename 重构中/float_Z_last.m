%/*-----确定积分上下限此处为左下积分----*/
%/*-----z的浮心位置坐标直接用积分体积比例表示--*/
%/*-----求出体积质量后直接比总重量----*/
function F=float_Z_last(A,B,H,z,c)
    d=tan(z)^2+4*A*c;
    xL=(tan(z)-sqrt(d))/(2*A);
    xR=(tan(z)+sqrt(d))/(2*A);
    xmin=-sqrt(H/A);xmax=sqrt(H/A);
    cof=4/(3*sqrt(B));Cof=1/sqrt(B);
   
    fun=@(x) (H-A*x^2)^1.5;%水上
    v=quadv(fun,xL,xR);v=v*cof;
    Fun=@(x) (H-A*x^2)^1.5;
    V=quadv(Fun,xmin,xmax);V=V*cof;
    volumn=V-v;
    %小v为体积，大V是关于x的体积积分
    funz=@(x) (H^2-A^2*x^4)*sqrt(H-A*x^2)-2*A*x^2*(H-A*x^2)^1.5/3-(H-A*x^2)^2.5/5;
    v=quadv(funz,xL,xR);v=v*Cof;
    Funz=@(x) (H^2-A^2*x^4)*sqrt(H-A*x^2)-2*A*x^2*(H-A*x^2)^1.5/3-(H-A*x^2)^2.5/5;
    V=quadv(Funz,xmin,xmax);V=V*Cof;
    vz=V-v;
    %fprintf("volumn is %f,vz is %f,",volumn,vz);%测试输出
    F=(vz)/volumn;

%      c=get_intercept_theat_180(A,B,H,V_boat,z);
%      d=(tan(z)^2+4*A*c)^0.5;
%      x_min=(tan(z)-d)/(2*A);
%      x_max=(tan(z)+d)/(2*A);
%      x_r=(H/A)^0.5;
%      x_l=-(H/A)^0.5;
%      
%     % fprintf("%f     %f\n",z*180/pi,c);
%      fun1=@(x) ((tan(z)*x+c)-A*x^2)^1.5;
%      Vo_1=quadv(fun1,x_min,x_max);
%      Vo_1=Vo_1*4/(3*B^0.5);
%      fun2=@(x) (H-A*x^2)^1.5;
%      Vo_2=quadv(fun2,x_l,x_r);
%      Vo_2=Vo_2*4/(3*B^0.5);
%      Vo_all=Vo_2-Vo_1;
%      
%      
%      fun3=@(x) (H^2-A^2*x^4-2*A*(H-A*x^2)/3-(H-A*x^2)^2/5)*(H-A*x^2)^0.5;
%      Vo_3=quadv(fun3,x_min,x_max);
%      Vo_3=Vo_3/B^0.5;
%      fun4=@(x) (H^2-A^2*x^4)*sqrt(H-A*x^2)-2*A*x^2*(H-A*x^2)^1.5/3-(H-A*x^2)^2.5/5;
%      Vo_4=quadv(fun4,x_l,x_r);
%      Vo_4=Vo_4*1/B^0.5;
%      Vo_all2=Vo_3-Vo_4;
%     % fprintf("Z不带%f  带%f\n",Vo_1,Vo_2);
%      F=Vo_all2/Vo_all;

end