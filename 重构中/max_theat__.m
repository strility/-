%/*----�õ�������б�Ƕ�----*/
%/*----�ܻ���-�»��ֵõ�----*/
function F=max_theat__(A,B,H,V_boat)
i=91;
cof=4/(3*sqrt(B));%��ϵ��
while(i<180)
    theta=i/180*pi;
    %fprintf("%dth calculate:",i);%
    c=H+tan(theta)*sqrt(H/A);
    d=tan(theta)^2+4*A*c;
    %fprintf("d is %f,",d);%
    fun=@(x) (H-tan(theta)*x+c)*(tan(theta)*x+c-A*x^2)^0.5;
    xmin=-sqrt(H/A);
    xmax=(tan(theta)+sqrt(d))/(2*A);
    volumn=quadv(fun,xmin,xmax);
    volumn=volumn*cof;
    Fun=@(x) (H-A*x.^2).^1.5;
    Cof=8/(3*sqrt(B));%
    V=quadv(Fun,xmax,-xmin);
    V=V*Cof;
    %fprintf("V is %f,vˮ�� is %f,",V,volumn);%�������
    volumn=V-volumn;
    %fprintf("volumn is %f\n",volumn);%�������
    if(volumn<V_boat)
        break;
    end
    i=i+1;
end
F=theta;
end
