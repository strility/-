%/*-----ȷ�����������޴˴�Ϊ���»���----*/
%/*-----x�ĸ���λ������ֱ���û������������ʾ--*/
%/*-----������������ֱ�ӱ�������----*/
function obtain_avs_X=float_X(A,B,H,V_boat,z,x_min,x_max)
    C=get_intercept(A,B,H,V_boat,z);
    %fprintf("�����C��%f",C)
    fun=@(x) x*((tan(z)*x+C-H/3-2*A*x^2/3)*sqrt(H-A*x^2));
    V_temp=quadv(fun,x_min,x_max);
    V_temp=V_temp*2/B^0.5;
    obtain_avs_X=V_temp/V_boat;
    %fprintf("���%f\n",V_temp);
end