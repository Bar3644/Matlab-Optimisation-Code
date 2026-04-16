%% 
%%%%%%%%%%Golden metoff

clear all
clc

syms A B x x1 x2 

f = 0.65 - (0.75/(1+x^2)) - 0.65*x*atan(1/x);

A = 0;
B = 3;
n =7;
m=n-1;
a=n+1;
F0 = 1;
F1 = 1;
F2=0;
P = B - A;

for i = 1:1:a
    
   F0=F1;
   F1=F2;
   F2=F0+F1;
   F(i)=F2;
   
end

for i = 1:1:a
   
       q(i) =  F(i);
      eval(['F' num2str(i) ' = q(i)']);
    
end

L0 = 0.382*P


m

%Ln = t(:,j)
for j = 2:1:(a-2)
    P = B - A;
    
    Ln = 0.382*P;
    
    L1=(B-A);
    
if (Ln>(L1/2))                          %%%L6 must change if n is bigger. use last L calculated
    
    x1 = B - Ln
    x2 = A + Ln
    
else
    
    x1 = A + Ln
    x2 = B - Ln
end

f1 = subs(f,x,x1);
f_1 = eval(f1)
f2 = subs(f,x,x2);
f_2 = eval(f2)
a;
m;
L1;


if f1<f2
    B = x2
    Ln = 0.382*P
      
end

if f1>f2
    A = x1
   Ln = 0.382*P
end


    if f1 ==f2
        
            A = x1
            B = x2
           Ln = (0.382*(B-A))
            
    end
    
   fprintf('\n...P..........A..........B........ x1............x2...........Ln..........L1\n\n')
   [P A B x1 x2 Ln L1]
   
    %pause();
    j = j+1
end
A
B











