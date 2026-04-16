%% INTERVAL HALVING METHOD
%  

clc;
clear all;
syms x;
%----------------------------------------
f(x) = x^2-1.5*x;
f(x) =(65/100)-((75/100)/(1+x^2))-(65/100)*x*(atan(1/x));
e = 0.01;              %small value for convergence test
Lo = [0 1];             %initial interval of uncertanty
%----------------------------------------
i = 0;
a = Lo(1,1);
b = Lo(1,2);
while b-a >= e
    L = b-a
    k = L/4
    a = Lo(1,1)
    b = Lo(1,2)
    x1 = a+k
    x0 = a+2*k
    x2 = b-k
    f1 = f(x1)
    f0 = f(x0)
    f2 = f(x2)
    if f2>f0 && f2>f1
        b = x0
        x0 = x1
    elseif f2<f0 && f2<f1
        a = x0
        x0 = x2
    elseif f1>f0 && f2>f0
        a = x1
        b = x2
     
    end
    Lo = [a b]
    i = i+1
end
fprintf('The optimum was found at the point: \n');
x=(a+b)/2
fprintf('This yields a function value of \n');
eval(f(x))
fprintf('This process took the following amount of iterations \n');
i