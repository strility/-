function the_theta=obtain_theat(H,A,B,V_boat)
i=1;
while(i<90)
    theta=i/180*pi;
    %fprintf("这是第%f角度\n",i);
    c=H-tan(theta)*(H/A)^0.5;
    F=@(x)(tan(theta)*x+c-H/3-2*A*x^2/3)*sqrt(H-A*x^2);
    %2*(H-A*x.^2)^1.5/3+tan(theta)*(x-sqrt(H/A)).*sqrt(H-A*x.^2);
    x_min=(tan(theta)-(tan(theta)^2-4*A*c)^0.5)/(2*A);
    x_max=(H/A)^0.5;
    V_temp=quadv(F,x_min,x_max);
    if(V_temp<V_boat)
        break;
    end
    i=i+1;
end
    the_theta=i/180*pi;
end


