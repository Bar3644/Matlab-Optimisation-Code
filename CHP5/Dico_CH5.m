%%

clear all
clc

syms x n fr

%------------------------------------------------------------------

F = x*(x - 1.5);
%F = 0.65 - (0.75./(1 + x.^2)) - 0.65*x.*((atan(1./x)));


interval = [0 1];
accuracy = 0.0000000000000001;
d = 0.001;
L = 1;

format long




%-----------------------------------------------------------------

accuracy = accuracy*2;
n = 2;

a = (1/fr)+ (d/L)*(1 - (1/fr)) - accuracy;
b = solve(a,fr);
c = (2^(n/2));

while (b >= c)
    
    n = n + 2;
    c = (2^(n/2));
    
end
n;

    x1   = L/2 - d/2;
    x2   = L/2 + d/2;

for i = 1:1:(n/2)
    
    
    f1   = eval(subs(F,x,x1));
    f2   = eval(subs(F,x,x2));    
    
    if (f2 < f1)
     interval(1,1) = x1;    
     min = x1;   
    else
     interval(1,2) = x2;    
     min = x2;   
    end
    
    x1 = (min + (L - min)/2) - (d/2);
    x2 = (min + (L - min)/2) + (d/2);    
    
end

fprintf('\n\nInterval found between: %d\n\n',interval)
a = [interval(1,1),interval(1,2)];
xopt = mean(a);
f   = eval(subs(F,x,xopt));
fprintf('\n\nX_optimum: %d\n\n',xopt)
fprintf('\n\nfunction value at X_optimum: %d\n\n',f)








