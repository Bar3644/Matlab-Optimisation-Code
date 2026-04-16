%%
clc
clear all
syms x1 x2 L l
%f = x1 - x2 + 2*x1^2 +2*x1*x2 + x2^2;
f = 100*(x2 -x1^2)^2 + (1-x1)^2;
%f = 100*(-x2 +x1^2)^2 + (1-x1)^2;
%f = (x1 +2*x2 -7)^2 + (2*x1 + x2 -5)^2;
x(1)=x1;
x(2)=x2;
xn = [-2;-2];
a=0;
n=2;
i = 0;
bi=eye(n);
L=0;
e = 0.00000001;
for j= 1:1:n
    df(j,1) = diff(f,x(j));
end
while ((i<100) && (a==0))
df1 = subs(df,[x1,x2],[xn(1,1),xn(2,1)]);
s =-bi*df1;
s=eval(s/((s(1,1)^2 + s(2,1)^2)^0.5));

xo=xn;
fx = xn + l*s;
fl = subs(f,[x1,x2],[fx(1,1),fx(2,1)]);
%l=eval(solve(diff(fl,L)));
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
ln = L;


xn=(xo  + ln*s);
df2 = subs(df,[x1,x2],[xn(1,1),xn(2,1)]);
g = df2-df1;
M = ln * s*s'/(s'*g);
N = -(bi*g)*(bi*g)'/(g'*bi*g);
bi = eval(bi + M + N);
df1 = subs(df,[x1,x2],[xn(1,1),xn(2,1)]);
s =-bi*df1;
if s==0
    a =1;
end
i=i+1;
end
fprintf('Final X values\n');
xn
fprintf('in so many iterations');
i
