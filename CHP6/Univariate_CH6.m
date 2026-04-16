%%
%%%%%%  Name          : Mohit Morar
%%%%%%  Student no    : 207165000
%%%%%%  Method        : Univarate method

clear all 
clc
syms x1 x2 L L2
format 

%%%%%%%%%%%%%%%%%The Function

%f(x1,x2)= x1 - x2 + 2*x1^2 +2*x1*x2+x2^2
f(x1,x2) = 100*(x2 - x1.^2).^2 + (1 - x1).^2; 
e = 0.00000001;
X = [-1;-2];
L1 = 0.10;
E = 0.000001;
mnm = 0;
p = 2;

S1 = [1 ; 0];
S2 = [0 ; 1];

m = 0;
f_5 = 0.01;
f_2 = 0.01;
f1 = 0.1;
while m == 0
    
    if ((f1 <= f_5) && (f1 <= f_2) &&(f1 <= f_1) && (f1 <= f_6))
    %if mnm >= 9
        
        m = 1;
        
    else
        
%%%%%%%%%%%%%%%%%%%%1st Iteration
 X_11 = X;
        f1 = f(X(1,1),X(2,1));
        a = (X + e*S1);
        b = (X - e*S1);
        
        f_1 = eval(f(a(1,1),a(2,1)));
        f_2 = eval(f(b(1,1),b(2,1)));

        if (f_1 < f1) 
        
            c = (X + L*S1);
            
        elseif f_2 < f1
            
            c = (X - L*S1);
        
        end
        
        f_3 = eval(f(c(1,1),c(2,1)));

        d2 = subs((diff(f_3,L)),L1);
        d3 = subs((diff(diff(f_3,L))),L1);
       
        while (abs(d2)>E)
            
              t1 =L1 - (d2/d3);
              L1 = eval(t1);
              dn = diff(f_3,L);
              d2 = subs(dn,L1);
              dn2 = diff(dn,L);
              d3 = subs(dn2,L1);
          
        end
        L1
        
        if (f_1 < f1)
            
            X2 = X + L1*S1;
            X_22 = X2;
            X = X2;
            f2 =  eval(f(X(1,1),X(2,1)))  ;     
            mnm = mnm+1;
            
        elseif f_2 < f1
        
            X2 = X - L1*S1;
            X_22 = X2;
            X = X2;
            f2 =  eval(f(X(1,1),X(2,1)))  ;                    
            mnm = mnm+1;
        
        end
        k1 = norm(X_22 - 1);
        k2 = (norm(X_11 - 1));
        k3 = (k1)/((k2).^p);
        zz(1,mnm) = k3(1,1);
        
        
        fprintf('\nIteration done:\n%d',mnm)
        X
    
  %%%%%%%%%%%%%%%%%%%% 2ND iteration     
   X_11 = X;
        o = (X + e*S2);
        g = (X - e*S2);

        f_5 = eval(f(o(1,1),o(2,1)));
        f_6 = eval(f(g(1,1),g(2,1)));
        
        if (f_5 < f2)
        
            h = (X + L*S2);
            
        elseif f_6 < f2
            
            h = (X - L*S2);
        
        end
 
        f_7 = eval(f(h(1,1),h(2,1)));

        h2 = subs((diff(f_7,L)),L1);
        h3 = subs((diff(diff(f_7,L))),L1);
        
        while (abs(h2)>E)
            
              t1 =L1 - (h2/h3);
              L1 = eval(t1);
              dn = diff(f_7,L);
              h2 = subs(dn,L1);
              dn2 = diff(dn,L);
              h3 = subs(dn2,L1);
          
        end
        
        if (f_5 < f2) 
        
            X2 = X + L1*S2;
             X_22 = X2;
              X = X2;
            f3 = eval( f(X(1,1),X(2,1)));
           
           mnm = mnm +1;
            
        elseif f_6 < f2
            
            X2 = X - L1*S2;
             X_22 = X2;
             X = X2;
            f3 = eval( f(X(1,1),X(2,1)));
            
            mnm = mnm +1;
            
        end
        
        k1 = norm(X_22 - 1);
        k2 = (norm(X_11 - 1));
        k3 = (k1)/((k2).^p);
        zz(1,mnm) = k3(1,1);   
        
        
   fprintf('\nIteration done:\n\n%d',mnm)     
   X      
   
    end
    mnm;
end
   
 fprintf('\n\n Number of Iterations done:\n\n%d',mnm)

fprintf('\n\n The function valuef:\n\n%d',eval(f1))

fprintf('\n\n The function valuef2:\n\n%d',f2)

fprintf('\n\n The function valuef3:\n\n%d',f3)

fprintf('\n\n X value at 10 iterations:\n\n')
X 
fprintf('\n\n Rate of Convergence:\n\n');
zz




X

