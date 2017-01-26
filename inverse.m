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