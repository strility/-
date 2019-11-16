%/*-----小船项目-------*/
%/*-作者：徐炜涛-------*/
%/*-功能：找寻复原力矩-*/
%/*-时间：2019-11-6--*/
%/--------------------*/


%/*-------首先确定方程为二次方程H=A*x^2+B*y^2---------*/
format long;
syms x y;
V_all=0.002;%此处为船的体积m3--是指当船满排水的时候的排水体积


%/*-----最简方程 A B 为用来反推的数据，H为船高 h为吃水线----*/
F_boat=@(x,y,H)A*x^2+B*y^2-H;
A=10;%系数
B=6;
H=0.15;
m_L=0.084; %重物长度为后面cad画图需要的参数
%由于良好的对称性，所以只需要考虑gz的位置
m_iron=0.8234;%重物质量
m_mast=0.1;%桅杆质量
m_focus_z=0.01+0.02;%龙骨高度+重物宽 重物z轴重心
m_boat_z=0.05;%船的重心
m_mast_z=0.04+0.01+0.25;%桅杆重心位置

%重心
center=calculate_center(m_focus_z,m_boat_z,m_mast_z);
m_total_z=(m_focus_z*0.8234+m_boat_z*0.25+m_mast_z*0.1);%此处的船体重心

%Art=get_add_tie_art(A,B,H);%画出重量增加的图
V_boat=0.0012;%此处为船的排除体积m3--实际排水体积（船的大致重量都可以测出）


%求浮心公式
%求出的浮心会在下面进行输出


 %while(A<20)
    
%调用the_main函数：
%/*--每个the_main函数都代表个每个阶段求得的复原力矩--*/
%/*--其中分为几个阶段：--------------*/
%/*--第一阶段：0-左上方交点----------*/
%/*--第二阶段：左上方交点-90---------*/
%/*--第三阶段：90-右上方交点---------*/
%/*--第四阶段：接近180的吃水---------*/
%/*--
%/*--每个
X=the_main2(A,B,H,V_boat,m_total_z);
Y=the_main3(A,B,H,V_boat,m_total_z);
%Z=the_main4(A,B,H,V_boat,m_total_z);
F=the_main5(A,B,H,V_boat,m_total_z);
T=the_main6(A,B,H,V_boat,m_total_z);
%fprintf("%d\n",K);
%把结果储存到矩阵中然后再制图




% X=[X Y F];
%end
f_water_line=the_0_to_xita(A,B,H,V_boat);%吃水线
fun_float=@(x) (f_water_line^2-A^2*x^4-(f_water_line^2-2*A*x^2*f_water_line+A^2*x^4)/5)*(f_water_line-A*x^2);
float_z=quadv(fun_float,0,(f_water_line/A)^0.5)/0.0012; 
flaot_z=float_z*2/sqrt(B);

%画图函数
%  F=water_line_art(A,B,H,f_water_line);
%输出
% fprintf("吃水线为%d\n",f_water_line);
% fprintf("船体重心位置(0,0,%d)\n",m_total_z);
% fprintf("船体浮心位置为(0,0,%d)\n",float_z);
% fprintf("%f",F_obtain);
