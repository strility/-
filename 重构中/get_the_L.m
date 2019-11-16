%/*----求力臂长度----*/
%/*----方向由角度定--*/
function L=get_the_L(float_avs_Z,float_avs_X,m_mast_z,z)
    L=(float_avs_Z-m_mast_z)*sin(z)+float_avs_X*cos(z);
end