%/*-----ȷ�����������޴˴�Ϊ���ϻ���----*/
%/*-----x�ĸ���λ������ֱ���û������������ʾ--*/
%/*-----������������ֱ�ӱ�������----*/
function F=the_main5(A,B,H,V_boat,m_total_z)
X=[];
theat=max_theat__(H,A,B,V_boat);
fprintf("%f\n",theat);
j=theat*180/pi;
i=91;
    while(i<180)
        z=i/180*pi;
        %fprintf("���ǵ�%f��i\n",i);
        c=get_intercept_theat_180(A,B,H,V_boat,z);
        %fprintf("%f\n",c);
        float_avs_Z=float_Z_theat_180(A,B,H,z,c);
        float_avs_X=float_X_theat_180(A,B,H,z,c);
        %fprintf("��������Ϊ��%f��0,%f)\n",float_avs_X,float_avs_Z) ;
        Restoring_L=get_the_L(float_avs_Z,float_avs_X,m_total_z,z);
        Restoring_data=Restoring_L*11.7600000000000;
        X=[X Restoring_data];
        fprintf("���ǵ�%d :����%f    ����%f\n",i,Restoring_L,Restoring_data);
        i=i+1;
    end
    F=X;
end
