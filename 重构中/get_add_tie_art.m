function F=get_add_tie_art(A,B,H)
V_boat=0.0004;
T=[];
U=[];
i=1;
while(V_boat<0.0014)
    T=[T V_boat];
    f_water_line=the_0_to_xita(A,B,H,V_boat);%吃水线
    U=[U f_water_line];
    plot(T,U);
    xlabel('x,重量');
    ylabel('y,吃水线');
    title('重量改变曲线图');
    V_boat=V_boat+0.00001;
    i=i+1;
end
F=1;
end