%%
clear all
clc
%LOWER and upper bounds
lb = zeros(3,1);
ub = Inf(3,1);
%Inequalities Less than 
A = [-0.1 -0.2 -0.4;-0.5 -0.3 -0.4];
b= [-30;-40];
%Equalities set up matrix like inequality
Aeq= zeros(3);
beq= [0;0;0];
%Objective function make matrix
f = [150 100 200];
[x fval] = linprog(f,A,b,Aeq,beq,lb,ub)

%%

%LOWER and upper bounds
lb = zeros(9,1);
ub = inf(9,1);
%Inequalities Less than 
A = [1 1 1 0 0 0 0 0 0;0 0 0 1 1 1 0 0 0;0 0 0 0 0 0 1 1 1;1 0 0 1 0 0 1 0 0;0 1 0 0 1 0 0 1 0;0 0 1 0 0 1 0 0 1;3 2 1 0 0 0 0 0 0;0 0 0 3 2 1 0 0 0;0 0 0 0 0 0 3 2 1];
b= [400;600;300;600;500;325;600;800;375];
%Equalities set up matrix like inequality
Aeq= [1/400 1/400 1/400 -1/600 -1/600 -1/600 0 0 0;1/400 1/400 1/400 0 0 0 -1/300 -1/300 -1/300];
beq= [0;0];
%Objective function make matrix
f = [-1000 -750 -250 -1000 -750 -250 -1000 -750 -250];
[x fval] = linprog(f,A,b,Aeq,beq,lb,ub)
%%
clear all
clc
%LOWER and upper bounds
lb = zeros(2,1);
ub = Inf(2,1);
%Inequalities Less than 
A = [-0.3 -0.4;-0.4 -0.4;-0.07 -0.04];
b= [-0.1714;-0.257;-0.02857];
%Equalities set up matrix like inequality
Aeq= zeros(2);
beq= zeros(2,1); 
%Objective function make matrix
f = [70 100];
[x fval] = linprog(f,A,b,Aeq,beq,lb,ub)
