%% 
clc
clear all
syms x1 x2 L
%f = x1 - x2 + 2*x1^2 +2*x1*x2 + x2^2;
 %f = (x1 +2*x2 -7)^2 + (2*x1 + x2 -5)^2;
f = 100*(x2 -x1^2)^2 + (1-x1)^2;
x(1)=x1;
x(2)=x2;
xn = [-2;-2];
alp = 10^4;
c1=0.25;
c2=2;
e = 0.001;
n=2;
i=0;
for k = 1:1:n
        d(k,1)=(diff(f,x(k)));
end
 dfo = subs(d,[x1,x2],[xn(1,1),xn(2,1)]);
 while (norm(dfo)>e)
    a=0;
    fo=eval(subs(f,[x1,x2],[xn(1,1),xn(2,1)]));
    dfo = eval(subs(d,[x1,x2],[xn(1,1),xn(2,1)])); 
    j=eval(subs(hessian(f),[x1,x2],[xn(1,1),xn(2,1)]));
    while (a==0)
    xn= (xn -inv(j+alp*eye(n))*dfo);
    fn=eval(subs(f,[x1,x2],[xn(1,1),xn(2,1)]));
    if fn<fo
        alp =c1*alp;
        i = i+1;
        a=1;
    else
        a=1;
        alp=alp*c2;
        
    end
    end
   
 end
 fprintf('The optimum x point is');
 (xn)
 i