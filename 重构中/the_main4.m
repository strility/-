%/*----此处的积分为两部分----*/
%/*----积分区域为右下和右上--*/
%/*----注意积分上下限-------*/
%/*----其余原理和上一个函数一样-*/
function F=the_main4(A,B,H,V_boat,m_total_z)
X=[];
theat=obtain_theat(H,A,B,V_boat);
j=theat*180/pi+1;
i=91;
    while(i<145)
        z=i/180*pi;
        %fprintf("这是第%f个i\n",i);
        c=get_intercept_90_180(A,B,H,V_boat,z);
        %fprintf("%f\n",c);
        float_avs_Z=float_Z_90_180(A,B,H,V_boat,z);
        float_avs_X=float_X_90_180(A,B,H,V_boat,z);
        %fprintf("浮心坐标为（%f，0,%f)\n",float_avs_X,float_avs_Z) ;
        Restoring_L=get_the_L(float_avs_Z,float_avs_X,m_total_z,z);
        Restoring_data=Restoring_L*11.7600000000000;
        X=[X Restoring_data];
        fprintf("这是第%d :力臂%f    力矩%f\n",i,Restoring_L,Restoring_data);
        i=i+1;
    end
    F=X;
end
