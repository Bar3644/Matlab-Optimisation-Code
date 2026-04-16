%% 
clc
clear all
syms x
%f = 0.65 -(0.75/(1+x^2)) -0.65*x*atan(1/x);
f= x*(x-1.5)
df =diff(f,x);
A =0;
B =0;
t =0.1;
c =0;
c1 =0;
e = 0.01;
i=0;
while c ==0
if subs(df,t) >= 0
    B = t;
    c =1;
else
    A = t;
    t = 2*t;
end
end
while c1==0
 x = A -(subs(df,A)*(B-A)/(subs(df,B)-subs(df,A)));
 if subs(df,x) < e
     c1=1;
 end
 if subs(df,x) >= 0
     B =x;
     i = i+1;
 else
     A = x;
     i=i +1 
 end
end
eval(x)
i;