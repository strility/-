%����-90�����غ͸���
%/*----�˴��Ļ���Ϊ������----*/
%/*----��������Ϊ���º�����--*/
%/*----ע�����������-------*/
%/*----����ԭ�����һ������һ��-*/
function F=the_main3(A,B,H,V_boat,m_mast_z)
X=[];
theat=obtain_theat(H,A,B,V_boat);
i=theat*180/pi+1;
    while(i<90)
        %fprintf("���ǵ�%f��i",i);
        %/*------�õ��ؾ�C----*/
        %/*------����---------*/
        %/*------����������---*/
        %/*------��ȡ��������--*/
        %/*------���۳���-----*/
        %/*------���ش�С-----*/
        z=i/180*pi;
        C=get_intercept(A,B,H,V_boat,z);
        float_avs_Z=float_Z_45(A,B,H,V_boat,z);
        float_avs_X=float_X_45(A,B,H,V_boat,z);
        %fprintf("��������Ϊ��%f��0,%f)\n",float_avs_X,float_avs_Z);
        Restoring_L=get_the_L(float_avs_Z,float_avs_X,m_mast_z,z);
        Restoring_data=Restoring_L*11.7600000000000;
        X=[X Restoring_data];
        fprintf("���ǵ�%d :����%f    ����%f\n",i,Restoring_L,Restoring_data);
        i=i+1;
    end
    F=X;
end
