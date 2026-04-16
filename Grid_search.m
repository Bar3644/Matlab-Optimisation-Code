%%% Grid search
clc
clear all
syms x1 x2
f = 6252.3136*x1 + 29.0532 + 14.5266*exp(-(abs((x2/0.2))^2)) + 2.905*x2   %function
n = 0.1;                                 %start value
m = 1;                                  %end value
int = 0.01;                              %intervals    
xf1 =0;
xf2 =0;
xf3 =0;
n1 =0.00621;
m1 =0.01;
int1 = 0.00001;
fo=subs(f,[x1,x2],[n,n1]);
for j = n:int:m
    for k = n1:int1:m1
        fn=subs(f,[x1,x2],[j,k]);
        eval(fn);
        if fn<fo
            fo=fn;
            xf1 =j;
            xf2 =k;
        end
        
    end
end
fprintf('Final function value');
eval(fo)
fprintf('Final X1 value');
xf1
fprintf('Final X2 value');
xf2
