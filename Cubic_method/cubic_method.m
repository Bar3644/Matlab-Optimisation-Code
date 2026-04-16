%-------------------------------------------------------------------------------------------
% French South African Institute of Technology
% Msc in Electronics systems Engineering
% Student :MIGABO ME     
% Student Number:210143327
% Lecturers: Prof Karim DJouani and Prof Alex Hamam Y.
%-------------------------------------------------------------------------------------------
% INTERPOLATION METHODS: CUBIC INTERPOLATION METHOD
%-------------------------------------------------------------------------------------------
clear all
clc
syms k; %k is lambda
n=input('Please enter the number of design variables: ');
% Stage 1: Normalization
%-------------------------------------------------------------------------------------------
fprintf('Enter the search direction:\n');
    for i=1:n
        fprintf('S(%d):',i)
        S(i)=input('');
        S_abs=abs(S(i));
    end
    fprintf('The Search direction is:\n')
    S=S'
    fprintf('Enter the starting point:\n');
    for i=1:n
        fprintf('X1(%d):',i)
        X1(i)=input('');
    end
    X1=X1'
    Delta=max(S_abs)
%Or Delta can be calculated as below, uncomment if u want to use that way
%And comment the delta calculation above
%     Delta=0
%     for i=1:n
%         Delta=((S(i))^2)+Delta;
%     end
    for i=1:n
        S_norm(i)=S(i)/Delta;
    end
    S_norm=S_norm'
    X=X1+k*S_norm
    f(k)=X^5 -5*X^3 -20*X +5;                   %enter function
    df(k)=diff(f(k),k)
    
% Stage 2: Establishing lower and upper bounds on the optimal step size 
%-------------------------------------------------------------------------------------------
lb=0;
A=lb;
to=input('Enter a preselected trial step length:')
if (df(to)>=0)
    ub=to;
    B=ub;
else
    count=1;
    while(df(to)<0)
        to=2*count*to;
        count=count+1;
    end
    ub=to;
    B=ub;
end
fprintf('The optimum step size is bounded in the interval %d < lambda <= %d\n', A,B)   
% Stage 3:
%-------------------------------------------------------------------------------------------
fA=f(A);
dfA=df(A);
fB=f(B);
dfB=df(B);
Z=((3*(fA-fB))/(B-A))+dfA+dfB;
b=(1/((A-B)^2))*(((B^2)*dfA)+((A^2)*dfB)+(2*A*B*Z));
c=(-1/((A-B)^2))*(((A+B)*Z)+(B*dfA)+(A*dfB));
d=(1/(3*((A-B)^2)))*((2*Z)+dfA+dfB);
a=dfA-(b*A)-(c*(A^2))-(d*(A^3));
fprintf('The Cubic function used to approximate f(k) is:\n')
h(k)=a+(b*k)+(c*(k^2))+(d*(k^3))
dh(k)=diff(h(k),k);
k_star_trial(1)=(-c+sqrt((c^2)-(3*b*d)))/(3*d);
k_star_trial(2)=(-c-sqrt((c^2)-(3*b*d)))/(3*d);
Q=eval(sqrt(Z^2-(dfA*dfB)))
k_star_trial_1=B*(dfA+Z+Q)/(dfA+dfB+(2*Z))
k_star_trial_2=B*(dfA+Z-Q)/(dfA+dfB+(2*Z))
if (k_star_trial(1)<=0)
    k_star_trial=k_star_trial(2);
else
    k_star_trial=k_star_trial(1);
    
end
fprintf('The trial minimum is :k_star_trial= %f\n', (eval(k_star_trial)));
% Stage 4: Make sure that this k_star_trial is sufficiently close to the true minimum k_star
% f(k) before taking k_star approximated by k_star_trial
%-------------------------------------------------------------------------------------------
num_max=input('Enter total number of refits: ');
fprintf('Enter the value of the desired accuracy\n')
Epsilon1=input('Epsilon1: ');
Epsilon2=input('Epsilon2 (Close to zero): ');
Obtained_accuracy(1)=abs((h(k_star_trial)-f(k_star_trial))/f(k_star_trial))
Obtained_accuracy(2)=df(k_star_trial);
num=0;
while ((Obtained_accuracy(1) > Epsilon1)&&(num<num_max)) || ((Obtained_accuracy(2) > Epsilon2)&&(num<num_max)) 
   %Reffiting the polynomial
   if(df(k_star_trial)<0)
       A=eval(k_star_trial)
       B=B
       fA=eval(f(A))
       dfA=eval(df(A))
   else
       A=A
       B=k_star_trial
       fB=f(B)
       dfB=df(B)
   end
    Z=eval(((3*(fA-fB))/(B-A))+dfA+dfB);
    b=(1/((A-B)^2))*(((B^2)*dfA)+((A^2)*dfB)+(2*A*B*Z));
    c=(-1/((A-B)^2))*(((A+B)*Z)+(B*dfA)+(A*dfB));
    d=(1/(3*((A-B)^2)))*((2*Z)+dfA+dfB);
    a=dfA-(b*A)-(c*(A^2))-(d*(A^3));
    fprintf('The Cubic function used to approximate f(k) is:\n')
    h(k)=eval(a+(b*k)+(c*(k^2))+(d*(k^3)))
   
    dh(k)=diff(h(k),k);
    Q=sqrt(Z^2-(dfA*dfB))
    k_star_trial_1=A+((dfA+Z+Q)*(B-A))/(dfA+dfB+(2*Z))
    k_star_trial_2=A+((dfA+Z-Q)*(B-A))/(dfA+dfB+(2*Z))
    if (k_star_trial_1<=0)
        k_star_trial=k_star_trial_2;
    else
        k_star_trial=k_star_trial_1;

    end
    fprintf('The trial minimum is :k_star_trial= %f\n', (eval(k_star_trial)));
    Obtained_accuracy(1)=abs((h(k_star_trial)-f(k_star_trial))/f(k_star_trial));
    Obtained_accuracy(2)=df(k_star_trial);
    num=num+1;
end   
fprintf('Done')
