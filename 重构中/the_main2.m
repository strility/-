%0-�����Ƕȵ����غ͸���
%��ȡ������һ���ҵ����������ԽǶ�Ϊ�ֽ������ޱƽ�
%ÿ����һ���ǶȾͻ�����һ���ؾ�ֵ
function F=the_main2(A,B,H,V_boat,m_total_z)
X=[];
theat=obtain_theat(H,A,B,V_boat);%1:�ҵ��Ƕ�
i=1;
    while(i<100)
        z=i/180*pi;
        if(z>theat)
            break;
        end
        %fprintf("���ǵ�%f��i",i);
        %/*------�õ��ؾ�C----*/
        %/*------����---------*/
        %/*------����������---*/
        %/*------��ȡ��������--*/
        %/*------���۳���-----*/
        %/*------���ش�С-----*/
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
        fprintf("���ǵ�%d:����%f   ����%f\n",i-1,Restoring_L,Restoring_data);
    end
    F=X;
end