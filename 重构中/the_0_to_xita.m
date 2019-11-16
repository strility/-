function F_=the_0_to_xita(A,B,H,V_boat)
pre=8/(3*B^0.5);
fun_of_tail=@(x) (H-A*x^.2).^1.5;
v=quadv(fun_of_tail,0,sqrt(H/A));
v=v*pre;
H_min=0;
H_max=H;
H_temp=double(H_min+H_max)/2;
i=1;
while(i<1000)
    F_change=@(x) (H_temp-A*x^2)^1.5;
    x_max=(H_temp/A)^0.5;
    V_temp=quadv(F_change,0,x_max);
    V_temp=V_temp*pre;
    if(V_temp>V_boat)
        if(H_temp<H_max)
          H_max=H_temp;
        end
    end
    if(V_temp<V_boat)
        if(H_temp>H_min)
            H_min=H_temp;
        end
    end
    if(V_temp==V_boat)
        break;
    end
    H_temp=double(H_min+H_max)/2;
    i=i+1;
end
F_=H_temp;
end
