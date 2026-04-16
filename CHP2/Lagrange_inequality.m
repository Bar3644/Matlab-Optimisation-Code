%%

clear all
clc

syms  x1 x2 s1 s2  

n = 2;                                   %Amount of variables
m = 5;                                   %Amount of constraints

F    = x1^2 + x2^2;
g(1) = x1 + 2*x2-15;
g(2) = 1- x1;
g(3) = 1- x2;
g(4) = -10+ x1;
g(5) = -10 + x2;
ip =[1 7];
s = [1 -1];
nablaf=[(diff(F,x1));diff(F,x2)];
nablaf=subs(nablaf,[x1,x2],[ip(1,1),ip(1,2)])
stf=[s1 s2]*nablaf
sdf=subs(stf,[s1,s2],[s(1,1),s(1,2)])
if sdf<=0
            fprintf('Usable condition satisfied');
        else
            fprintf('Not usable cond');
        end
for j = 1:1:m
    k=subs(g(j),[x1,x2],[ip(1,1),ip(1,2)]);
   if k == 0
        eval(['g' num2str(j) ' = g(j)']);
        fprintf('constraint is active\n');
        nablag= ([diff(g(j),x1) ;diff(g(j),x2)]);
        nablag=subs(nablag,[x1,x2],[ip(1,1),ip(1,2)])
        st= [s1 s2]*nablag
        sd =subs(st,[s1,s2],[s(1,1),s(1,2)])
        if sd<=0
            fprintf('Feasible condition satisfied');
        else
            fprintf('Not feasible cond');
        end
    end
end

