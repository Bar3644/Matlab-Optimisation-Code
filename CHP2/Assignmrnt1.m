%% 2.1.1
clear all
clc
syms x1 x2 c
f = 0.5*x1^2 +x1*x2 +2*x2^2 -4*x1 -4*x2 -x2^3; %Enter Function 
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
m=zeros(b);
while c<=b
    m(c,1) =subs(j1,[x1 x2],[s.x1(c,1) s.x2(c,1)]);
    m(c,2) =subs(j2,[x1 x2],[s.x1(c,1) s.x2(c,1)]);
    final = subs(f,[x1 x2],[s.x1(c,1) s.x2(c,1)])
    c=c+1;
   
end
m
ezsurf(f)
%% 2.1.2
clear all
clc
syms x1 x2 c
f = x1^3 + x2^2; %Enter Function 
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
m=zeros(b);
while c<=b
    m(c,1) =subs(j1,[x1 x2],[s.x1(c,1) s.x2(c,1)]);
    m(c,2) =subs(j2,[x1 x2],[s.x1(c,1) s.x2(c,1)]);
    final = subs(f,[x1 x2],[s.x1(c,1) s.x2(c,1)])
    c=c+1;
    
end
m
ezsurf(f)
%% 2.1.3
clear all
clc
syms x1 x2 c
f = (x1 + x2)./(3*x1.^2 + x2.^2 + x1*x2); %Enter Function 
f1=diff(f,x1);
f1 = simple(f1)
f3 = simple(diff(f1,x2))
f2=diff(f,x2);
f2 = simple(f2)
f11=diff(f1,x1);
f11=simple(f11)
f22=diff(f2,x2);
f22=simple(f22)
s=solve(f1,f2,x1,x2);
s.x1;
s.x2;
a = size(s.x1);
b=a(1,1);
m1=zeros(b);
m1(:,1)=s.x1;
m1(:,2)=s.x2;
m1
h=simple(hessian(f))
j1=h(1,1)
j2=det(h)
c=1;
m=zeros(b);
while c<=b
    m(c,1) =subs(j1,[x1 x2],[s.x1(c,1) s.x2(c,1)]);
    m(c,2) =subs(j2,[x1 x2],[s.x1(c,1) s.x2(c,1)]);
    final = subs(f,[x1 x2],[s.x1(c,1) s.x2(c,1)])
    c=c+1;
    
end
m
ezsurf(f)
%% 2.2
clear all
clc
syms x1 x2 c
f = (x2^2 - x1)^2; %Enter Function 
f1=diff(f,x1);
f1=simple(f1)
f2=diff(f,x2);
f2=simple(f2)
f11=diff(f1,x1)
f22=diff(f2,x2)
s=solve(f1,f2,x1,x2);
s.x1
s.x2
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
m=zeros(b);
while c<=b
    m(c,1) =subs(j1,[x1 x2],[s.x1(c,1) s.x2(c,1)]);
    m(c,2) =subs(j2,[x1 x2],[s.x1(c,1) s.x2(c,1)]);
    final = subs(f,[x1 x2],[s.x1(c,1) s.x2(c,1)])
    c=c+1;
    
end
m
ezsurf(f)