# EE183DA_lab1

%forward kinematics
function T = FDK(theta1,theta2,theta3,theta4)
alpha0 = 0;
alpha2 = 0;
alpha3 = 0;
alpha4 = 0;
alpha1 = 90;
theta5 = 0;

Tc1 = [1 0 0 0; 0 cosd(alpha0) -sind(alpha0) 0; 0 sind(alpha0) cosd(alpha0) 0; 0 0 0 1];
c1Tb1 = [1 0 0 0; 0 1 0 0; 0 0 1 0; 0 0 0 1];
b1Ta1 = [cosd(theta1) -sind(theta1) 0 0; sind(theta1) cosd(theta1) 0 0; 0 0 1 0; 0 0 0 1];
a1T1 = [1 0 0 0; 0 1 0 0; 0 0 1 0; 0 0 0 1];


Tc2 = [1 0 0 0; 0 cosd(alpha1) -sind(alpha1) 0; 0 sind(alpha1) cosd(alpha1) 0; 0 0 0 1];
c2Tb2 = [1 0 0 0; 0 1 0 0; 0 0 1 0; 0 0 0 1];
b2Ta2 = [cosd(theta2) -sind(theta2) 0 0; sind(theta2) cosd(theta2) 0 0; 0 0 1 0; 0 0 0 1];
a2T2 = [1 0 0 0; 0 1 0 0; 0 0 1 0; 0 0 0 1];

Tc3 = [1 0 0 0; 0 cosd(alpha2) -sind(alpha2) 0; 0 sind(alpha2) cosd(alpha2) 0; 0 0 0 1];
c3Tb3 = [1 0 0 5000; 0 1 0 0; 0 0 1 0; 0 0 0 1];
b3Ta3 = [cosd(theta3) -sind(theta3) 0 0; sind(theta3) cosd(theta3) 0 0; 0 0 1 0; 0 0 0 1];
a3T3 = [1 0 0 0; 0 1 0 0; 0 0 1 0; 0 0 0 1];

Tc4 = [1 0 0 0; 0 cosd(alpha3) -sind(alpha3) 0; 0 sind(alpha3) cosd(alpha3) 0; 0 0 0 1];
c4Tb4 = [1 0 0 2500; 0 1 0 0; 0 0 1 0; 0 0 0 1];
b4Ta4 = [cosd(theta4) -sind(theta4) 0 0; sind(theta4) cosd(theta4) 0 0; 0 0 1 0; 0 0 0 1];
a4T4 = [1 0 0 0; 0 1 0 0; 0 0 1 0; 0 0 0 1];

Tc5 = [1 0 0 0; 0 cosd(alpha4) -sind(alpha4) 0; 0 sind(alpha4) cosd(alpha4) 0; 0 0 0 1];
c5Tb5 = [1 0 0 1000; 0 1 0 0; 0 0 1 0; 0 0 0 1];
b5Ta5 = [cosd(theta5) -sind(theta5) 0 0; sind(theta5) cosd(theta5) 0 0; 0 0 1 0; 0 0 0 1];
a5T5 = [1 0 0 0; 0 1 0 0; 0 0 1 0; 0 0 0 1];

T1 = Tc1*c1Tb1*b1Ta1*a1T1;
T2 = Tc2*c2Tb2*b2Ta2*a2T2;
T3 = Tc3*c3Tb3*b3Ta3*a3T3;
T4 = Tc4*c4Tb4*b4Ta4*a4T4;
T5 = Tc5*c5Tb5*b5Ta5*a5T5;
T = T1*T2*T3*T4*T5;
end

%inverse kinematics
function [a,b,c,d]=inverse(px,py,pz,r)
x=sqrt(px^2+py^2);
y=pz;
a1=5000;
a2=2500;
a3=1000;
pwx=x-a3*cosd(r);
pwy=y-1000*sind(r);
c2=(pwx^2+pwy^2-2500^2-5000^2)/(2*2500*5000);
s2=sqrt(1-c2^2);
c=atan2d(s2,c2);
s1=((a1+a2*c2)*pwy-a2*s2*pwx)/(pwx^2+pwy^2);
c1=((a1+a2*c2)*pwx+a2*s2*pwy)/(pwx^2+pwy^2);
b=atan2d(s1,c1);
d=r-c-b;
a=acosd(px/x);
end
