clear all
clc
syms x1 x2 c
f= RosenB(x1,x2) 
pretty(f)
f1=diff(f,x1)
f2=diff(f,x2)
f11=diff(f1,x1)
f22=diff(f2,x2)
s=solve(f1,f2,x1,x2);
s.x1;
s.x2;
a = size(s.x1);
b=a(1,1);
m1=zeros(b);
m1(:,1)=s.x1;
m1(:,2)=s.x2;
m1
h=hessian(f)
j1=h(1,1)
j2=det(h)
c=1;
m = zeros(b)
while c<=b
    m(c,1) =subs(j1,[x1 x2],[s.x1(c,1) s.x2(c,1)])
    m(c,2) =subs(j2,[x1 x2],[s.x1(c,1) s.x2(c,1)])
    final = subs(f,[x1 x2],[s.x1(c,1) s.x2(c,1)])
    c=c+1;
   
end
m
ezsurf(f)