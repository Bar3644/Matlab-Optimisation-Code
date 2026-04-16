%% 
clc
clear all
syms x1 x2 L l
%f = 100*(x2 -x1^2)^2 + (1-x1)^2;
%f = x1 - x2 + 2*x1^2 +2*x1*x2 + x2^2;
f = x1^2 +x2^2 -x1*x2;
%f = 2*x1^2 +x2^2 +x1*x2 +x2;
x(1)=x1;
x(2)=x2;
xn = [-1.2;-2];
a=0;
n=2;
i=1;
e= 0.00001;
e1=0.000000001;
L =0;
for k = 1:1:n
        d(k,1)=(diff(f,x(k)));
end
while (a ==0) && (i <1000)
    df = subs(d,[x1,x2],[xn(1,1),xn(2,1)]);
    if (df(1,1)==0) && (df(2,1)==0)
        a=1;
    end
    s =-df;
    xm= xn +l*s;
    if s ==0
        a=1;
    else
    %Ln=solve(diff(subs(f,[x1,x2],[xm(1,1),xm(2,1)]),L),L);
    fl = subs(f,[x1,x2],[xm(1,1),xm(2,1)]);
    fn =eval(fl);
    d2 = subs(diff(fn,l),L);
    while (abs(d2)>e1)
        d2 = subs(diff(fn,l),L);
        d3 = subs(diff(diff(fn,l),l),L);
         L =L - (d2/d3);
        L=eval(L);
    end
    Ln = L;
    xt = xn;
    xn = eval(xn + Ln*s);
    
    if abs(xt-xn)< e
        a=1;
    end
    i =i +1;
end
end
fprintf('Answer for minimun');
xn
fprintf('In so many iterations');
i