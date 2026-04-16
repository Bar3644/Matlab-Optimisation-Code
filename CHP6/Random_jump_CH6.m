%-------------------------------------------------------------------------------------------
% French South African Institute of Technology
% Msc in Electronics systems Engineering
% Student :MIGABO ME     
% Student Number:210143327
% Lecturers: Prof Karim DJouani and Prof Alex Hamam Y.
%-------------------------------------------------------------------------------------------
% RANDOM SEARCH METHODS: RANDOM JUMPING METHOD
%-------------------------------------------------------------------------------------------
clear all
clc
format long
% Establishing bounds l(i) and u(i) for each design variables
n=input('Enter the number of design variables:')
number_of_trials=input('Enter the number of trials:')
trials=number_of_trials;
if(n==2)
    syms x1 x2;
    x=[x1,x2]
    f(x1,x2)=100*(x2 - x1.^2).^2 + (1 - x1).^2;
else
    if(n==3)
    syms x1 x2 x3;
    x=[x1,x2,x3]
    f(x1,x2,x3)=100*(x2 - x1.^2).^2 + (1 - x1).^2;  
    end
end
for i=1:n
   fprintf('For X(%d):\nl(%d)=',i,i)
   l(i)=input('');
   fprintf('u(%d)=',i)
   u(i)=input('');
end
j=1;
while(number_of_trials~=0)
    
    % Generating a set of n random numbers
    r=rand(1,n) %returns an 1-by-n matrix containing pseudorandom values drawn
                %from the standard uniform distribution on the open interval (0,1). 
    % Finding a point, X inside the hypercube
    for i=1:n
        X1(i)=l(i)+((r(i))*(u(i)-l(i)));
    end
    
    X(j,:)=X1;
    
    if(n==2)
    fX(j)=eval(f(X1(1),X1(2)));
    end
    if(n==3)
    fX(j)=eval(f(X1(1),X1(2),X(3)));
    end
    number_of_trials=number_of_trials-1;
    j=j+1;
end
k=0;
for(j=1:trials)
    if(fX(j)==min(fX))
        k=j;
        break
    end
end

fprintf('The obtained points inside the hypercube are:');
X_values=X'
fprintf('And the values of the function at the obtained points are:');
fX_values=fX'
fprintf('The minimum point obtained is:\n');
X_min=X(k,:);
X_min=X_min'
fprintf('It was found after %d trial(s)\n',k)
