syms x1 x2 alp bet
a = exp(x1 +x2) +2*alp*(x1-3) +14*bet ==0
b = exp(x1 +x2) -28 +2*alp*(x2-5) -6*bet ==0
c = alp*((x1-3)^2 + (x2-5)^2-4) ==0
d = (x1-3)^2 + (x2-5)^2 - 4<=0
e = 14*x1 - 6*x2 - 12 ==0
f = alp >=0
[x1 x2 alp bet] = solve(a,b,c,d,e,f,x1,x2,alp,bet)