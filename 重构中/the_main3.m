%西塔-90的力矩和浮心
%/*----此处的积分为两部分----*/
%/*----积分区域为右下和右上--*/
%/*----注意积分上下限-------*/
%/*----其余原理和上一个函数一样-*/
function F=the_main3(A,B,H,V_boat,m_mast_z)
X=[];
theat=obtain_theat(H,A,B,V_boat);
i=theat*180/pi+1;
    while(i<90)
        %fprintf("这是第%f个i",i);
        %/*------得到截距C----*/
        %/*------吊塔---------*/
        %/*------积分上下限---*/
        %/*------求取浮心坐标--*/
        %/*------力臂长度-----*/
        %/*------力矩大小-----*/
        z=i/180*pi;
        C=get_intercept(A,B,H,V_boat,z);
        float_avs_Z=float_Z_45(A,B,H,V_boat,z);
        float_avs_X=float_X_45(A,B,H,V_boat,z);
        %fprintf("浮心坐标为（%f，0,%f)\n",float_avs_X,float_avs_Z);
        Restoring_L=get_the_L(float_avs_Z,float_avs_X,m_mast_z,z);
        Restoring_data=Restoring_L*11.7600000000000;
        X=[X Restoring_data];
        fprintf("这是第%d :力臂%f    力矩%f\n",i,Restoring_L,Restoring_data);
        i=i+1;
    end
    F=X;
end
