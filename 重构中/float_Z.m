%/*-----确定积分上下限此处为右下积分----*/
%/*-----z的浮心位置坐标直接用积分体积比例表示--*/
%/*-----求出体积质量后直接比总重量----*/
function obtain_avs_Z=float_Z(A,B,H,V_boat,z,x_min,x_max)
     C=get_intercept(A,B,H,V_boat,z);
     fun=@(x) ((tan(z)*x+C)^2-A^2*x^4-2*A*x^2/3*(H-A*x^2)-(H-A*x^2)^2/5)*(H-A*x^2)^0.5;
     %(H^2-A^2*x^4)*sqrt(H-A*x^2)-2*A*x^2.*(H-A*x^2)^1.5/3-(H-A*x^2)^2.5/5;
     V_temp=quadv(fun,x_min,x_max);
     V_temp=V_temp*2/B^0.5;
     obtain_avs_Z=V_temp/0.0012;
     %fprintf("Z的坐标%f\n",obtain_avs_Z);
end