%% Exhaustive search
clc
clear all
syms x
f = x*(x-1.5);
a = 0;
b = 1;
e =10/100;
n = e^-1 - 1;
s=1/10;
s1=s;
ans =0;
for k = 2:1:(n+1)
    g(k)=subs(f,s)
    if g(k) == g(k-1)
        ans = (s +(s-s1))/2 ;
    end
    s=s + s1;
end
ans
%% 
