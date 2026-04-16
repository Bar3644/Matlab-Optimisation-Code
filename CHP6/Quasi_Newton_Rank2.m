%%
clc
clear all
syms x1 x2 L
f = x1 - x2 + 2*x1^2 +2*x1*x2 + x2^2;
%f = (x1 +2*x2 -7)^2 + (2*x1 + x2 -5)^2;
x(1)=x1;
x(2)=x2;
xn = [0;0];
a=0;
n=2;
a=0;
i = 0;
bi=eye(n);
for j= 1:1:n
    df(j,1) = diff(f,x(j));
end
while ((i<5) && (a==0))
df1 = subs(df,[x1,x2],[xn(1,1),xn(2,1)]);
s =-bi*df1;
xo=xn;
fx = xn + L*s;
fl = subs(f,[x1,x2],[fx(1,1),fx(2,1)]);
l=eval(solve(diff(fl,L)));
xn= xo  - l*bi*df1;
df2 = subs(df,[x1,x2],[xn(1,1),xn(2,1)]);
g = df2-df1;
M = l * s*s'/(s'*g);
N = -(bi*g)*(bi*g)'/(g'*bi*g);
bi = bi + M + N
df1 = subs(df,[x1,x2],[xn(1,1),xn(2,1)]);
s =-bi*df1;
if s==0
    a =1;
end
i=i+1;
end
fprintf('Final X values\n');
eval(xn)
fprintf('in so many iterations');
i
