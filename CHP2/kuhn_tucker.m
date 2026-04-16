%%
clear all
clc
syms x1 x2 x3 L1 L2 L3
v(1)= x1;
v(2)= x2;
v(3)= x3;
l(1)= L1;
l(2)= L2;
l(3)= L3;
n = 2;                                  %variables
m = 2;                                  %constraints
f = 625.3136*x1 - 2.90532 - 1.45266*exp(-(abs(x2/0.2))^2) -0.29876*x2;;
g(1) = x1 -0.35573;
g(2) = x2 - 0.35573;
%g(3) = (x1 + x2 + x3 -150);
fprintf('First set of equations due to diff\n');
for k = 1:1:n
    df(k) = diff(f,v(k));
    for j = 1:1:m
        df(k) =  df(k) + l(j)*diff(g(j),v(k));
    end
    df(k)
end
fprintf('Second set of equations(constraints)\n');
for k = 1:1:m
    E(k) = l(k) *g(k);
    g(k)>=0;
    G(k)= ans;
    E(k)
    G(k)
    l(k)<=0;
    H(k) = ans;
    H(k)
end
[x1,x2,x3,l1,l2,l3] = solve(df(1),df(2),df(3),E(1),E(2),E(3),G(1),G(2),G(3),H(1),H(2),H(3),x1,x2,x3,L1,L2,L3)
