%0-西塔角度的力矩和浮心
%求取函数第一步找到西塔角再以角度为分界线无限逼近
%每提升一个角度就会计算出一个截距值
function F=the_main2(A,B,H,V_boat,m_total_z)
X=[];
theat=obtain_theat(H,A,B,V_boat);%1:找到角度
i=1;
    while(i<100)
        z=i/180*pi;
        if(z>theat)
            break;
        end
        %fprintf("这是第%f个i",i);
        %/*------得到截距C----*/
        %/*------吊塔---------*/
        %/*------积分上下限---*/
        %/*------求取浮心坐标--*/
        %/*------力臂长度-----*/
        %/*------力矩大小-----*/
        C=get_intercept(A,B,H,V_boat,z);
        b=(tan(z)^2+4*A*C)^0.5;
        x_min=(tan(z)-b)/(2*A);
        x_max=(tan(z)+b)/(2*A);
        float_avs_Z=float_Z(A,B,H,V_boat,z,x_min,x_max);
        float_avs_X=float_X(A,B,H,V_boat,z,x_min,x_max);
        Restoring_L=get_the_L(float_avs_Z,float_avs_X,m_total_z,z);
        Restoring_data=Restoring_L*11.7600000000000;
        X=[X Restoring_data];
        i=i+1;
        fprintf("这是第%d:力臂%f   力矩%f\n",i-1,Restoring_L,Restoring_data);
    end
    F=X;
end