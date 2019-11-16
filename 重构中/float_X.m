%/*-----确定积分上下限此处为右下积分----*/
%/*-----x的浮心位置坐标直接用积分体积比例表示--*/
%/*-----求出体积质量后直接比总重量----*/
function obtain_avs_X=float_X(A,B,H,V_boat,z,x_min,x_max)
    C=get_intercept(A,B,H,V_boat,z);
    %fprintf("这里的C是%f",C)
    fun=@(x) x*((tan(z)*x+C-H/3-2*A*x^2/3)*sqrt(H-A*x^2));
    V_temp=quadv(fun,x_min,x_max);
    V_temp=V_temp*2/B^0.5;
    obtain_avs_X=V_temp/V_boat;
    %fprintf("体积%f\n",V_temp);
end