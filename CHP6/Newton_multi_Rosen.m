%% 
clc
clear all
syms x1 x2 L
f(x1,x2)= RosenB(x1,x2) 
x(1)=x1;
x(2)=x2;
xn = [-1.2;-2];
n=2;
i =0;
j1 = inv(hessian(f));
test = 0;
while (test~=1)
 j = subs(j1,[x1,x2],[xn(1,1),xn(2,1)]);
 eval(j);
for k = 1:1:n
        d(k,1)=subs((diff(f,x(k))),[x1,x2],[xn(1,1),xn(2,1)]);
end
xs = xn -j*d;
xn = eval(xs);
for k = 1:1:n
        d(k,1)=subs((diff(f,x(k))),[x1,x2],[xn(1,1),xn(2,1)]);
end
if d == 0
    test =1;
end
i =i +1;
end
fprintf('X final values');
xn
fprintf('Number of iterations');
i
