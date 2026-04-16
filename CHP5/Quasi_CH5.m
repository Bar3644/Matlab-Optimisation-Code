%%
%Quasi Newton CH5 -

%Created by CC Oosthuizen, April 2014
%Std number: 209319829
%Tel: 0829270995

%Code Ref: 2014/OPT/

clear all
clc
syms  x
format long

%--------------------------START here----------------------------------

F            = 0.65 -(0.75/(1+x^2)) -0.65*x*atan(1/x);     %Function
%F = x^5-(5*x^3)-(20*x)+5;
lambda       = 0.1;                                          %start point
step         = 0.01;                                          %step size        
conv         = 0.01

%-------------------------STOP here------------------------------------

p = 0;
count = 0;

while (p == 0)
        
    fprintf('\n\nIteration number: %d.....................\n\n', count)
    
    f1 = eval(subs(F,lambda));
    f_plus  = eval(subs(F,x,(lambda + step)));
    f_minus = eval(subs(F,x,(lambda - step)));
    lambda = lambda - (step*(f_plus - f_minus))/(2*(f_plus - 2*f1 + f_minus));
    
    check = abs((f_plus - f_minus)/(2*step));
    
    if (check <= conv)
        fprintf('\n\nOPTIMUM LAMBDA FOUND AT ITERATION: %d with the value of: %d\n\n\n',count,lambda)
        p = 1;
    end

    count = count + 1;
end


