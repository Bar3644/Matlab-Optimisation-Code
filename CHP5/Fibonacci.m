%% Fibonacci
clear all
clc
syms  x x1 x2 f j
%%%%%%%%%%%%%edit from here%%%%%%%%%%%%%
f= 0.65 -(0.75/(1+x^2)) -0.65*x*atan(1/x);      %Function
a = 0;                                          %start point
b = 3;                                          %end point        
fibb = 6;                                      %fibbonacci number    
%%%%%%%%%%%%edit to here%%%%%%%%%%%%%%%%
fibb = fibb+1;
fibb2 = 0;
fibb0 = 1;
fibb1 = 1;
for k = 1:1:(fibb)
    fibb0 = fibb1;
    fibb1 = fibb2;
    fibb2 = fibb0+fibb1;
    fb(k) = fibb2;
end
l2= (fibb0/fibb2) *(b-a);
for j=2:1:(fibb-2)
l1 = (b - a);
    if l2>(l1/2)
        x1 = (b - l2);
        x2 = (a + l2);
    else
        x1 = a + l2;
        x2 = b - l2;
    end
    f1 = subs(f,x1);
    f2 = subs(f,x2);
    if f1>f2
        a = x1;
        l2=fb(fibb-j)*l1/fb(fibb-(j-2));
    end
   if f1<f2
        b = x2;
        l2=fb(fibb-j)*l1/fb(fibb-(j-2));
   end
   if f1==f2
        a = x1;
        b = x2;
        l2= fb(fibb-j)*(b - a)/fb(fibb-(j-2));
        j =j+1;
    end
    j=j+1;    
end
x1
x2
 
