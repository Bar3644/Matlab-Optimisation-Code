%% Constrained non linear
%Edit objfun and confunceq
clear all
clc
syms x1 x2
x(1) =x1;
x(2) =x2;
x0 = [-10,-10];                %Starting point
options = optimoptions(@fmincon,'Algorithm','sqp');
%[x,fval] = fmincon(@objfun,x0,A,b,Aeq,beq,lb,ub,@confunceq,options)
% @objfun = objective function as function
% x0 = startting points [  ]
% A = input matrix for linear inequality constraint : Ax <=b must be smaller as
% b = output vector for inequality matrix.
% Aeq = input matrix for linear equality Aeq.x = beq
% beq = output vector for equality linear constraint
% lb = lower bound can start at 0
% ub = upper bound can be inf
% @confunceq = function of nonlinear constraints
% options = fmincon options set
[x,fval] = fmincon(@objfun,x0,[],[],[],[],[],[],@confunceq,options)


