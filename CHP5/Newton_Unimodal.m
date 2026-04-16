%% Newton Unimodal
clc
clear all
syms x d
f = 0.65 - 0.75/(1+x^2) - 0.65*x*atan(1/x);
e = 0.01;
xi = 0.1;
d2 = subs(diff(f,x),xi)
d3 = subs(diff(diff(f,x),x),xi);
c=0;
while (abs(d2)>e)
    c = c +1;
    xi =(xi - (d2/d3));
    eval(xi)
    d1 = eval(subs(f,xi));
    d2 = eval(subs(diff(f,x),xi));
    d3 = eval(subs(diff(diff(f,x),x),xi));     
end
fprintf('The X value at convergence  ');
eval(xi)
fprintf('at iteration');
c