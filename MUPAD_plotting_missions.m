%%
clc
clear all

mphandle = mupad

z = x1 + x2;

g1 = x1 - x2 <= 1;
g2 = 3*x2 + 2*x2 >=6;



% z = exp(x1 + x2) - 28*x2
% 
% g1 = (x1 - 3)^2 + (x2 - 5)^2 <= 4
% g2 = 14*x1 - 6*x2 == 12


%k := [{x1 - x2  <= 1, 3*x1 + 2*x2 >= 6}, x1 + x2, NonNegative]:
%g := linopt::plot_data(k, [x1, x2]):
%plot(g):


%%
clc
clear all

%A = [0.1 0.1 0.4 0.6 0.3 0.3 0.3 0.5 0.2 -1 0 0 1 0 0;0.1 0.3 0.5 0.3 0.3 0.4 0.2 0.4 0.3 0 -1 0 0 1 0;0.8 0.6 0.1 0.1 0.4 0.3 0.5 0.1 0.5 0 0 -1 0 0 1]
B = [140 795 220;210 1060 330;70 265 165] 
b = [1200;1600;500]

bnot = inv(B)*b






Binv = inv(B)*bnot


Cet = [0 0];
Cbt = [30 40 0];
E = [0 0;1 0;0 1]

binv = inv(B)
bnot = binv*[150;100;200] 

Cet_not = Cet - Cbt*inv(B)*E

%P = binv*[0.5;0.3;0.4]



%%
