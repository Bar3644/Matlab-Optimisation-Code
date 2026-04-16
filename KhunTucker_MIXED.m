%%
%KHUN-TUCKER MIXED

%Created by CC Oosthuizen, May 2014
%Std number: 209319829
%Tel: 0829270995

%Code Ref: 2014/OPT/code

clc
clear all

%--------------------------ONLY edit from here-----------------------------
syms  x1 x2 L L1 L2 B B1 B2

n    = 2;                                   %Amount of variables
eq   = 1;                                   %Amount of EQUALITY constraints (h with beta (B))
ineq = 1;                                   %Amount of IN-EQUALITY constraints (g with lambda (L))                         

minmax = 1;                               %1 = min, 0 = max

var(1) = x1;                              %declare variables to use
var(2) = x2;


F    = exp(x1 + x2) - 28*x2;
h(1) = (14*x1 - 6*x2 - 12)*B;
g(1) = ((x1 - 3)^2  + (x2 - 5)^2 - 4)*L;

F = 2*x1^3 + 15*x2^2 - 8*x1*x2;
h(1) = (x1^2 + x1*x2 + 1)*B;
g(1) = (4*x1 - x2^2 - 4)*L;

%--------------------------ONLY edit to here-------------------------------

Fnew = F;

for i = 1:eq
   Fnew = Fnew + h(i);    
end

for i = 1:ineq
   Fnew = Fnew + g(i);    
end

fprintf('KUHN-TUCKER CONDITIONS equation is..........\n\n')
Fnew

for i = 1:n
a(i) = diff(Fnew,var(i))
fprintf('\n\nDiff towards X%d is : ',i)
a(i)

end

fprintf('other KUHN-TUCKER CONDITIONS equations are..........\n\n')

%------------------------------EDIT HERE AGAIN!!!!!!!!!!!!!!!
eq1 = g(1)   == 0
eq2 = g(1)/L <= 0
eq3 = h(1)/B == 0
eq4 = L >= 0

[L,B,x1,x2] = solve(a,eq1,eq2,eq3,eq4,L,B,x1,x2);
eval(L)
eval(B)
eval(x1)
eval(x2)





