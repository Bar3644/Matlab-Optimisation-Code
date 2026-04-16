%% UNRESTRICTED SEARCH 
%  FIXED STEP SIZE

clc;
clear all;
syms x xn;
%------------------------------------
f(x) = x^2-1.5*x;
f(x)=(65/100)-((75/100)/(1+x^2))-(65/100)*x*(atan(1/x))

x = 1;                 %assumed starting point
s = 0.01;              %assumed step size
%-----------------------------------
xn=x+s;    
f1=f(x);
f2=f(xn);
if f2 < f1
    while f2 < f1
        x=xn;
        xn=x+s;
        f1=f(x);
        f2=f(xn);
    end
    fprintf('The minimum has been found around the point: %d\n',x);

elseif f2 > f1
    xn=x-s;
    f2=f(xn);
    while f2 < f1
        x=xn;
        xn=x-s;
        f1=f(x);
        f2=f(xn);
    end
    fprintf('The minimum has been found around the point: %d\n',x);
end

%% UNRESTRICTED SEARCH
%  ACCELERATED STEP SIZE
clc;
clear all;
syms x xn;
%------------------------------------
f(x) = x^2-1.5*x;
%f(x)=(65/100)-((75/100)/(1+x^2))-(65/100)*x*(atan(1/x))

x = 0.752;                      %assumed starting point
s = 0.0005;               %assumed step size
%-----------------------------------
xn=x+s;    
f1=f(x);
f2=f(xn);
if f2 < f1
    while f2 < f1
        x=xn
        xn=x+s
        f1=f(x);
        f2=f(xn);
        s=2*s
    end
    fprintf('The minimum has been found around the point: %d\n',x);

elseif f2 > f1
    xn=x-s;
    f2=f(xn);
    while f2 < f1
        x=xn;
        xn=x-s;
        f1=f(x);
        f2=f(xn);
        s=2*s;
    end
    fprintf('The minimum has been found around the point: %d\n',x);
end
