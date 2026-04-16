%% Random walk method
clc
clear all
syms x1 x2 r1 r2

%f = x1 - x2 + 2*x1^2 +2*x1*x2 + x2^2;
%f = 100*(x2-x1^2)^2 + (1-x1)^2;%enter function
%f = x1^2 +x2^2 -x1*x2;
f=2*x1^2 +x2^2 +x1*x2 +x2;
xi =0;                                      %enter start x1 value
xii =0;                                     %enter start x2 
s =1;
e =0.001;                                    %enter final error
n = 100;                                    %enter iterations    
a =0;
c=0;
t=0;
fo = subs(f,[x1,x2],[xi,xii]);              %add extra variables
while (s>e)
    c=0;
while (c<n)
    a=0;
    while (a==0)                            
    r1=(2)*rand() -1;                       %add another variable to gen random numbers    
    r2=(2)*rand() -1;
    if ((r1^2 +r2^2)^0.5)<=1                %add extra generated variable
        a=1;
    end
    end
u =1/((r1^2 +r2^2)^0.5);                     % add extra generated variable  
xi = xi + s*u*r1;                               
xii = xii + s*u*r2;                          %add another x variable with corresponding r var   
fn = subs(f,[x1,x2],[xi,xii]);
if fn<fo
    fo=fn;
    c=0;
elseif fn>=fo
    xi = xi - s*u*r1;
    xii = xii - s*u*r2;                      %add another x variable with corresponding r var
    c=c+1;  
end
t=t+1;
end
s=s/2;
end
fprintf('X1 value');
xi
fprintf('X2 value');
xii
fprintf('Final function value');
eval(fo)
fprintf('iterations');
t


