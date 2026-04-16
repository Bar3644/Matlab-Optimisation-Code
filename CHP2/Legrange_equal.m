%%
clear all
clc
syms  x1 x2 x3 x4 L1 L2 L3 L4 z

n = 4;                                   %Amount of variables
m = 2;                                   %Amount of constraints
minmax = 1;                              %1 = min, 0 = max

var(1) = x1;                             %declare variables to use
var(2) = x2;
var(3) = x3;
var(4) = x4;

F    = 0.5*(x1.^2 + x2.^2 + x3.^2 + x4.^2)
g(1) = x1 + 2*x2 + 3*x3 + 5*x4 -10
g(2) = x1 + 2*x2 + 5*x3 + 6*x4 -15

fprintf('SETTING UP THE LAGRANGE\n')
for i = 1:1:m                  
 L_m(i) = g(i)*(eval(['L' num2str(i)]));
 eval(['Lagrange_multipliers' num2str(i) ' = L_m(i)']) 
end
Fn=F;
for j = 1:1:m
    Fn = Fn + L_m(j);
end
fprintf('Langrange Function =')
Fn
fprintf('Neccesary Conditions\n')
for k = 1:1:n
    dldx(k) = diff(Fn,var(k));
    eval(['dLdx' num2str(k) ' = dldx(k)'])
end
for l = 1:1:m
    L(l) = eval(['L' num2str(l)]);
    dLdl(l) = diff(Fn,L(l));
    eval(['dLdl' num2str(l) ' = dLdl(l)'])
end
[X1 X2 X3 X4 l1 l2] = solve(dLdx1,dLdx2,dLdx3,dLdx4,dLdl1,dLdl2,x1,x2,x3,x4,L1,L2)
h = eye(n+m) * (-z);
for a=n+1:1:n+m
    h(a,a) = 0;
end
for r = 1:1:n
    for c = 1:1:n
        h(r,c) = h(r,c) + diff(diff(Fn,var(r)),var(c));
    end
end
for r = 1:1:n
    for c =n+1:1:n+m
        h(r,c) = diff(g(c-n),var(r));
    end
end

for r = n+1:1:n+m
    for c =1:1:n
        h(r,c) = diff(g(r-n),var(c));
    end
end
fi = det(h);
BG =size(X1);
for d = 1:1:BG(1,1)
    final=subs(fi,[x1,x2,L1],[X1(d,1),X2(d,1),l1(d,1)])
    solve(final==0)
end