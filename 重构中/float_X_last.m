function F=float_X_last(A,B,H,z,c)

    d=tan(z)^2+4*A*c;
    xL=(tan(z)-sqrt(d))/(2*A);
    xR=(tan(z)+sqrt(d))/(2*A);
    xmin=-sqrt(H/A);
    xmax=sqrt(H/A);
    cof=4/(3*sqrt(B));
    
    fun=@(x) (H-A*x^2)^1.5;
    v=quadv(fun,xL,xR);v=v*cof;
    Fun=@(x) (H-A*x^2)^1.5;
    V=quadv(Fun,xmin,xmax);V=V*cof;
    volumn=V-v;
    %СvΪ�������V�ǹ���x���������
    funx=@(x) x*(H-A*x^2)^1.5;
    v=quadv(funx,xL,xR);v=v*cof;
    Funx=@(x) x*(H-A*x^2)^1.5;
    V=quadv(Funx,xmin,xmax);V=V*cof;
    vx=V-v;
   % fprintf("volumn is %f,Vx is %f,",volumn,vx);%�������
    F=(vx)/volumn;

%      c=get_intercept_theat_180(A,B,H,V_boat,z);
%      d=(tan(z)^2+4*A*c)^0.5;
%      
%      x_min=(tan(z)-d)/(2*A);
%      x_max=(tan(z)+d)/(2*A);
%      x_l=-(H/A)^0.5;
%      x_r=(H/A)^0.5;
%      %ȫ����
%      fun1=@(x) (H-A*x^2)^1.5;
%      Vo_1=quadv(fun1,x_min,x_max);
%      Vo_1=Vo_1*4/(3*B^0.5);
%      fun2=@(x) (H-A*x^2)^1.5;
%      Vo_total=quadv(fun2,x_l,x_r);
%      Vo_total=Vo_total*4/(3*B^0.5);
%      Vo_all=Vo_total-Vo_1;
% 
%      %��x��  ���
%      fun3=@(x) x*(H-A*x^2)^1.5;
%      Vo_3=quadv(fun3,x_min,x_max);
%      Vo_3=Vo_3*4/(3*B^0.5);
%      fun4=@(x) x*(H-A*x^2)^1.5;
%      Vo_4=quadv(fun4,x_l,x_r);
%      Vo_4=Vo_4*4/(3*B^0.5);
%      Vo_all2=Vo_4-Vo_3;
%      %fprintf("X����%f  ��%f\n  ",Vo_1,Vo_total);
%      F=Vo_all2/Vo_all;
     
     
%     %x������������
%      fun1=@(x) x*2/3*(H-A*x^2)^1.5;
%      Vo_x=quadv(fun1,x_left,x_min);
%      Vo_x=Vo_x*2/B^0.5;
%      
%      fun2=@(x) x*(tan(z)*x+c-A*x^2-(tan(z)*x+c-A*x^2)/3)*sqrt(tan(z)*x+c-A*x^2);
%      Vo_X=quadv(fun2,x_min,x_max);
%      Vo_X=Vo_X*2/B^0.5;
%      Vo_xall=Vo_X+Vo_x;
%      fprintf("X����ĸ��ģ�%f       %f\n",Vo_x,Vo_X);
%     
%     %�������� 
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