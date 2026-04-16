%% Fixed step size
clc
clear all
syms x xn
f = (0.65 -(0.75/(1+x^2)) -0.65*x*atan(1/x));
z = 0;
s = 0.01;
c = 0;
x = 0.1;
fo = subs(f,x);
xn = x + s;
fn = subs(f,xn);
if fn < fo
while (z == 0)
    if fn < fo
        fo=fn;
        xn = xn +s;
        fn = subs(f,xn);
    else
        z =1;
        xn - s
    end
    c= c+1;
end
else
        fo = subs(f,x);
        xn = x - s;
        fn = subs(f,xn);
    while (z==0)
        
        if fn < fo
        fo=fn;
        xn = xn - s;
        fn = subs(f,xn);
    else
        z =1;
        xn + s
    end
    c= c+1;
    end
end
c
ezsurf(f)
