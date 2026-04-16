%% BFGS
clear all
clc
syms x x1 x2 L l
%f = x1 - x2 + 2*x1^2 +2*x1*x2 + x2^2;
f = 100*(x2 -x1^2)^2 + (1-x1)^2;
%f=(x1 +2*x2-7)^2 + (2*x1+x2-5)^2;
x(1)=x1;
x(2)=x2;
xn = [-1.2;-2];
n= 2;
b = eye(n);
e =0.0001;
a=0;
L =0;
i=0;
for j= 1:1:n
    df(j,1) = diff(f,x(j));
end
while (a==0) & (i<100)
 X=xn;
    k1(1,i+1)=X(1,1);
    k2(1,i+1)=X(2,1);    
df1 = subs(df,[x1,x2],[xn(1,1),xn(2,1)]);
s =-b*df1;
fx = xn + l*s;
fl = subs(f,[x1,x2],[fx(1,1),fx(2,1)]);
fn =eval(fl);
d2 = subs(diff(fn,l),L);
while (abs(d2)>e)
    d2 = subs(diff(fn,l),L);
    d3 = subs(diff(diff(fn,l),l),L);
    L =L - (d2/d3);
    L=eval(L);
end
dfl = L;
%dfl=eval(solve(diff(fl,L)));
xn = eval(xn + s*dfl);
for j= 1:1:n
    df2(j,1) = diff(f,x(j));
end
f2=subs(df2,[x1,x2],[xn(1,1),xn(2,1)]);
if norm(f2)< e
    a=1;
end
g= f2 - df1;
d=dfl*s;
b=b +(1+g'*b*g/(d'*g))*(d*d'/(d'*g)) - d*g'*b/(d'*g)-b*g*d'/(d'*g);
b=eval(b);
 X=xn;
    k1(1,i+2)=X(1,1);
    k2(1,i+2)=X(2,1);
i=i+1;

end
xn
eval(subs(f,[x1,x2],[xn(1,1),xn(2,1)]))
i
figure(1)
ezcontourf(f,[2,-2,3,-3.3]);
hold on
figure(1) 
plot(k1,k2,'--rs','LineWidth',2,'MarkerEdgeColor','black','MarkerFaceColor','green','MarkerSize',10)
hold on