%/*-----С����Ŀ-------*/
%/*-���ߣ������-------*/
%/*-���ܣ���Ѱ��ԭ����-*/
%/*-ʱ�䣺2019-11-6--*/
%/--------------------*/


%/*-------����ȷ������Ϊ���η���H=A*x^2+B*y^2---------*/
format long;
syms x y;
V_all=0.002;%�˴�Ϊ�������m3--��ָ��������ˮ��ʱ�����ˮ���


%/*-----��򷽳� A B Ϊ�������Ƶ����ݣ�HΪ���� hΪ��ˮ��----*/
F_boat=@(x,y,H)A*x^2+B*y^2-H;
A=10;%ϵ��
B=6;
H=0.15;
m_L=0.084; %���ﳤ��Ϊ����cad��ͼ��Ҫ�Ĳ���
%�������õĶԳ��ԣ�����ֻ��Ҫ����gz��λ��
m_iron=0.8234;%��������
m_mast=0.1;%Φ������
m_focus_z=0.01+0.02;%���Ǹ߶�+����� ����z������
m_boat_z=0.05;%��������
m_mast_z=0.04+0.01+0.25;%Φ������λ��

%����
center=calculate_center(m_focus_z,m_boat_z,m_mast_z);
m_total_z=(m_focus_z*0.8234+m_boat_z*0.25+m_mast_z*0.1);%�˴��Ĵ�������

%Art=get_add_tie_art(A,B,H);%�����������ӵ�ͼ
V_boat=0.0012;%�˴�Ϊ�����ų����m3--ʵ����ˮ��������Ĵ������������Բ����


%���Ĺ�ʽ
%����ĸ��Ļ�������������


 %while(A<20)
    
%����the_main������
%/*--ÿ��the_main�����������ÿ���׶���õĸ�ԭ����--*/
%/*--���з�Ϊ�����׶Σ�--------------*/
%/*--��һ�׶Σ�0-���Ϸ�����----------*/
%/*--�ڶ��׶Σ����Ϸ�����-90---------*/
%/*--�����׶Σ�90-���Ϸ�����---------*/
%/*--���Ľ׶Σ��ӽ�180�ĳ�ˮ---------*/
%/*--
%/*--ÿ��
X=the_main2(A,B,H,V_boat,m_total_z);
Y=the_main3(A,B,H,V_boat,m_total_z);
%Z=the_main4(A,B,H,V_boat,m_total_z);
F=the_main5(A,B,H,V_boat,m_total_z);
T=the_main6(A,B,H,V_boat,m_total_z);
%fprintf("%d\n",K);
%�ѽ�����浽������Ȼ������ͼ




% X=[X Y F];
%end
f_water_line=the_0_to_xita(A,B,H,V_boat);%��ˮ��
fun_float=@(x) (f_water_line^2-A^2*x^4-(f_water_line^2-2*A*x^2*f_water_line+A^2*x^4)/5)*(f_water_line-A*x^2);
float_z=quadv(fun_float,0,(f_water_line/A)^0.5)/0.0012; 
flaot_z=float_z*2/sqrt(B);

%��ͼ����
%  F=water_line_art(A,B,H,f_water_line);
%���
% fprintf("��ˮ��Ϊ%d\n",f_water_line);
% fprintf("��������λ��(0,0,%d)\n",m_total_z);
% fprintf("���帡��λ��Ϊ(0,0,%d)\n",float_z);
% fprintf("%f",F_obtain);
