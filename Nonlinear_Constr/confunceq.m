function [ c, ceq] = confunceq( x )
%Nonlinear inequality constraints always smaller than
c = (x(1)-3)^2 + (x(2) -5)^2 -4;
%Nonlinear eqaulity constraints
ceq = 14*x(1) -6*x(2) - 12;
end

