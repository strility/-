function F=calculate_center(m_focus_z,m_boat_z,m_mast_z)
k=0.001;
T=[];
U=[];
while(k<1)
    m_total_z=(m_focus_z*-k+m_boat_z*0.25+m_mast_z*0.1);%此处的船体重心
    T=[T k];
    U=[U m_total_z];
    plot(T,U);
    xlabel('重量');
    ylabel('对应重心');
    title('重量改变重心图');
    k=k+0.001;
    
end
F=1;
end