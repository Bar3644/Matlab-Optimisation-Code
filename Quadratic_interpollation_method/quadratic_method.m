%-------------------------------------------------------------------------------------------
% French South African Institute of Technology
% Msc in Electronics systems Engineering
% Student :MIGABO ME     
% Student Number:210143327
% Lecturers: Prof Karim DJouani and Prof Alex Hamam Y.
%-------------------------------------------------------------------------------------------
% INTERPOLATION METHODS: QUADRATIC INTERPOLATION METHOD
%-------------------------------------------------------------------------------------------
clear all
clc
syms k; %k is lambda
n=input('Please enter the number of design variables: ');
if n==1
    fprintf('Enter the search direction:\n');
    s=input('s:');
    fprintf('Enter the starting point:\n');
    x1=input('x1:');
    x=x1+k*s;
    f(k)=quad_obj_fun(x);
    
else
    fprintf('Enter the search direction:\n');
    for i=1:n
        fprintf('S(%d):',i)
        S(i)=input('');
    end
    fprintf('The Search direction is:\n')
    S=S'
    fprintf('Enter the starting point:\n');
    for i=1:n
        fprintf('X1(%d):',i)
        X1(i)=input('');
    end
    X1=X1'
    Delta=max(S)
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
    f(k)=quad_obj_fun(X)
end
to=input('Enter a preselected trial step length:')
fA=f(0)
f1=f(to)

exit_flag=0;
while(exit_flag==0)
    if (f1>fA)
        fC=f1;
        fB=f(to/2);
        t=to/2;
        k_star_trial=(((4*fB)-(3*fA)-fC)*t)/(4*fB-(2*fC)-(2*fA))
        exit_flag=1;
    else
        fB=f1;
        f2=f(2*to)
        if (f2>f1)
            fC=f2;
            t=to;
            k_star_trial=(((4*fB)-(3*fA)-fC)*t)/(4*fB-(2*fC)-(2*fA))
            exit_flag=1;
        else
            f1=f2;
            to=2*to; 
            exit_flag=0;
        end
    end
end
[fA, fB, fC]

a=fA;
b=((4*fB)-(3*fA)-fC)/(2*t);
c=(fC+fA-(2*fB))/(2*(t^2));
fprintf('The quadratic function used to approximate f(k) is:\n')
h(k)=a+(b*k)+(c*(k^2))
fprintf('The minimum of h(k) is: %s\n',char(k_star_trial))

% Make sure that this k_star_trial is sufficiently close to the true minimum k_star
% f(k) before taking k_star approximated by k_star_trial
exit_value=0;
while(exit_value==0)
    fprintf('Choose a test method among the following two:\n')
    fprintf('1. Test by comparing f(k) and h(k)\n')
    fprintf('2. Test by df/dk close to zero evaluation\n')
    choice=input('Choice:\n')
    if (choice==1 || choice==2)
 
        exit_value=1;
    else
        frpintf('Wrong choice, try again\n')
        exit_value=0;
    end
end
if (choice==1)
        num_max=input('Enter total number of refits: ');
        fprintf('Enter the value of the desired accuracy\n')
        Epsilon1=input('Epsilon1: ');
        Obtained_accuracy=abs((h(k_star_trial)-f(k_star_trial))/f(k_star_trial))
        A=0;
        B=t;
        C=2*t;
        num=0;
        while (Obtained_accuracy > Epsilon1 && num<num_max)
            
            %Reffiting the polynomial
            
            f_k=f(k_star_trial);
           
            if (k_star_trial>B)
                if (f_k < fB)
                    A=B;
                    B=k_star_trial;
                    C=C;
                else
                    A=A;
                    B=B;
                    C=k_star_trial;
                end
            else
                if (f_k < fB)
                    A=A;
                    B=k_star_trial;
                    C=B;
                else
                    A=k_star_trial;
                    B=B;
                    C=C;
                end
            end
            fA=f(A);
            fB=f(B);
            fC=f(C);
            
     
            k_star_trial=((fA*(B^2-C^2))+fB*(C^2-A^2)+fC*(A^2-B^2))/(2*(fA*(B-C)+fB*(C-A)+fC*(A-B)))
            a=((fA*B*C*(C-B))+(fB*C*A*(A-C))+(fC*A*B*(B-A)))/((A-B)*(B-C)*(C-A));
            b=(fA*(B^2-C^2)+fB*(C^2-A^2)+fC*(A^2-B^2))/((A-B)*(B-C)*(C-A));
            c=(-((fA*(B-C))+fB*(C-A)+fC*(A-B))/((A-B)*(B-C)*(C-A)));
            fprintf('The quadratic function used to approximate f(k) is:\n')
            h(k)=a+(b*k)+(c*(k^2))
            fprintf('The minimum of h(k) is: %s\n',char(k_star_trial))
            Obtained_accuracy=abs((h(k_star_trial)-f(k_star_trial))/f(k_star_trial))
            num=num+1;
            
        end
        k_star=(k_star_trial)
else
        fprintf('Enter the value of the desired accuracy\n')
        Epsilon2=input('Epsilon2: ');
        small_change=0.001;
        Obtained_accuracy=abs((f(k_star_trial+(small_change*k_star_trial))-(f(k_star_trial-(small_change*k_star_trial))))/(2*small_change*k_star_trial))
        A=0;
        B=t;
        C=2*t;
        while(Obtained_accuracy>Epsilon2)
        
       
        %Reffiting the polynomial
       
        f_k=f(k_star_trial);
        if (k_star_trial>B)
            if (f_k < fB)
                A=B;
                B=k_star_trial;
                C=C;
            else
                A=A;
                B=B;
                C=k_star_trial;
            end
        else
            if (f_k < fB)
                A=A;
                B=k_star_trial;
                C=B;
            else
                A=k_star_trial;
                B=B;
                C=C;
            end
        end
        fA=(f(A));
        fB=(f(B));
        fC=(f(C));

        k_star_trial=((fA*(B^2-C^2))+fB*(C^2-A^2)+fC*(A^2-B^2))/(2*(fA*(B-C)+fB*(C-A)+fC*(A-B)))
        a=(((fA*B*C*(C-B))+(fB*C*A*(A-C))+(fC*A*B*(B-A)))/((A-B)*(B-C)*(C-A)));
        b=(((fA*(B^2-C^2)+fB*(C^2-A^2)+fC*(A^2-B^2))/((A-B)*(B-C)*(C-A))));
        c=(-((fA*(B-C))+fB*(C-A)+fC*(A-B))/((A-B)*(B-C)*(C-A)));
        fprintf('The quadratic function used to approximate f(k) is:\n')
        h(k)=a+(b*k)+(c*(k^2))
        fprintf('The minimum of h(k) is: %s\n',char(k_star_trial))
        Obtained_accuracy=abs((f(k_star_trial+(small_change*k_star_trial))-(f(k_star_trial-(small_change*k_star_trial))))/(2*small_change*k_star_trial))
        end
        k_star=k_star_trial;   
end

fprintf('The obtained step length is Lambda_star= %s\n',char(k_star))


