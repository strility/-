function F=float_Z_theat_180(A,B,H,theta,c)
    d=tan(theta)^2+4*A*c;
    xmin=-sqrt(H/A);%左极限点x
    xL=(H-c)/tan(theta);%左交点x
    xR=(tan(theta)+sqrt(d))/(2*A);%右交点x
    xmax=sqrt(H/A);%右极限点x
    cof=4/(3*sqrt(B));Cof=1/sqrt(B);
    fun1=@(x) (tan(theta)*x+c-A*x.^2).^1.5;%右边
    v1=quadv(fun1,xL,xR);v1=v1*cof;
    fun2=@(x) (H-A*x.^2).^1.5;%左边
    v2=quadv(fun2,xmin,xL);v2=v2*cof;
    v=quadv(fun2,xmin,xmax);v=v*cof;
    volumn=v-v1-v2;
    %小v为体积，大V是关于z的体积积分
    Fun1=@(x) ((tan(theta)*x+c).^2-A^2*x.^4).*sqrt(tan(theta)*x+c-A*x.^2)-2*A*x.^2.*(H-A*x.^2).^1.5/3-(tan(theta)*x+c-A*x.^2).^2.5/5;
    V1=quadv(Fun1,xL,xR);V1=V1*Cof;
    Fun2=@(x) (H^2-A^2*x.^4).*sqrt(H-A*x.^2)-2*A*x.^2.*(H-A*x.^2).^1.5/3-(H-A*x.^2).^2.5/5;
    V2=quadv(Fun2,xmin,xL);V2=V2*Cof;
    V=quadv(Fun2,xmin,xmax);V=V*Cof;
    Vz=V-V1-V2;
    F=Vz/volumn;

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
%      fun2=@(x) (H-A*x.^2)^1.5;
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