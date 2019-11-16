function F=get_intercept_45(A,B,H,V_boat,z)
    c_min=H-tan(z)*(H/A)^0.5;
    c_max=100;%或0.15；
    c_center=(c_min+c_max)/2;
    i=1;
    while(i<100)
        d=(tan(z)^2+4*A*c_center)^0.5;
        x_min=(tan(z)-d)/(2*A);
        x_max=(H-c_center)/tan(z);
        x_r=(H/A)^0.5;
        
        %左部分
        fun1=@(x) 2/3*(tan(z)*x+c_center-A*x^2)^1.5;
        Vo_1=quadv(fun1,x_min,x_max);
        Vo_1=Vo_1*2/(B^0.5);
        %右部分
        fun2=@(x) 2/3*(H-A*x^2)^1.5;
        Vo_2=quadv(fun2,x_max,x_r);
        Vo_2=Vo_2*(2/(B^0.5));
        Vo_all=Vo_1+Vo_2;
        
 
        if(Vo_all>V_boat)
            if(c_center<c_max)
                c_max=c_center;
            end
        end
        if(Vo_all<V_boat)
            if(c_center>c_min)
                c_min=c_center;
            end
        end
        c_center=(c_min+c_max)/2;
        i=i+1;
    end
    F=c_center;
end