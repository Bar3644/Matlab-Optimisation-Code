%%
clear all
clc
%-----------------------------------------------------------------------

%Slack + artificial variables
%EXAMPLE
% A  = [1 -1 1 0 0;3 2 0 -1 1];
% b  = [1;6];
% Ct = [0 0 0 0 1];
% Xb = [3;5];
% Xe = [1;2;4];
% B = [1 0;0 1];


%EXAMPLE3 (diagrams)
% Xb = [3;4;6]
% Xe = [1;2;5]
% A  = [1 2 1 0 0 0; 2 1 0 1 0 0;6 5 0 0 -1 1];
% B = [1 0 0;0 1 0; 0 0 1]
% b  = [4;5;30];
% Ct = [0 0 0 0 0 1];


%EXAMPLE4 (diagrams)
% Xb = [5;6]
% Xe = [1;2;3;4]
% A  = [1 2 -1 0 1 0;2 1 0 -1 0 1];
% B = [1 0;0 1]
% b  = [4;5];
% Ct = [0 0 0 0 1 1];



%EXAM 2011 P1
% A  = [11.3 9 18.3 1 0 0 0 0;0.9 0 0.7 0 -1 0 1 0;4 15 30 0 0 -1 0 1]
% b  = [10;0.8;15];
% Ct = [0 0 0 0 0 0 1 1];
% Xb = [4;7;8];
% Xe = [1;2;3;5;6];
% B = [1 0 0;0 1 0;0 0 1];


%EXAM 2011 P3
% A  = [-2 -1 1 1 0 0;-1 2 -1 0 1 0;-3 1 0 0 0 1]
% b  = [1;2;3];
% Ct = [0 0 0 1 1 1];
% Xb = [4;5;6];
% Xe = [1;2;3];
% B = [1 0 0;0 1 0;0 0 1];



%EXAM 2011 P4
A  = [1 2 5 0 1 0;1 1 1 -1 0 1]
b  = [10;1];
Ct = [0 0 0 0 1 1];
Xb = [5;6];
Xe = [1;2;3;4];
B = [1 0;0 1];


%PROBLEM1
%   A = [0.1 0.2 0.4 -1 0 1 0;0.5 0.3 0.4 0 -1 0 1];
%   b = [30;40];
%   Ct = [0 0 0 0 0 1 1];
%   Xb = [6;7];
%   Xe = [1;2;3;4;5];
%   B = [1 0;0 1];

%PROBLEM2 - dual!!
%    A = [1 9 -1 0 1 0;1 5 0 -1 0 1];
%    b = [8;5];
%    Ct = [0 0 0 0 1 1];
%    Xb = [5;6];
%    Xe = [1;2;3;4];
%    B = [1 0;0 1];


%PROBLEM3
%  A = [0.1 0.1 0.4 0.6 0.3 0.3 0.3 0.5 0.2 1 0 0;0.1 0.3 0.5 0.3 0.3 0.4 0.2 0.4 0.3 0 1 0;0.8 0.6 0.1 0.1 0.4 0.3 0.5 0.1 0.5 0 0 1];
%  b = [30;30;40];
%  Ct = [0 0 0 0 0 0 0 0 0 1 1 1];
%  Xb = [10;11;12];
%  Xe = [1;2;3;4;5;6;7;8;9];
%  B = [1 0 0;0 1 0;0 0 1];
 
 
 %EXAM 2009 part2
%     1 2 3 4 5 6 7 8 9 10
% A  = [1 1 1 0 0 0 0 0 0 1 0 0 0 0 0 0 0 0 0 0;...
%       0 0 0 1 1 1 0 0 0 0 1 0 0 0 0 0 0 0 0 0;...
%       0 0 0 0 0 0 1 1 1 0 0 1 0 0 0 0 0 0 0 0;...
%       1 0 0 1 0 0 1 0 0 0 0 0 1 0 0 0 0 0 0 0;...
%       0 1 0 0 1 0 0 1 0 0 0 0 0 1 0 0 0 0 0 0;...
%       0 0 1 0 0 1 0 0 1 0 0 0 0 0 1 0 0 0 0 0;...
%       3 2 1 0 0 0 0 0 0 0 0 0 0 0 0 1 0 0 0 0;...
%       0 0 0 3 2 1 0 0 0 0 0 0 0 0 0 0 1 0 0 0;...
%       0 0 0 0 0 0 3 2 1 0 0 0 0 0 0 0 0 1 0 0;...
%       1/400 1/400 1/400 -1/600 -1/600 -1/600 0 0 0 0 0 0 0 0 0 0 0 0 1 0;...
%       0 0 0 1/600 1/600 1/600 -1/300 -1/300 -1/300 0 0 0 0 0 0 0 0 0 0 1;...
%       
%       ];
% b  = [400;600;300;600;500;325;600;800;375;0;0];
% Ct = [0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 1 1];
% Xb = [10;11;12;13;14;15;16;17;18;19;20];
% Xe = [1;2;3;4;5;6;7;8;9];
% B = eye(11);




%-----------------------------------------------------------------------
art_included = 1;
slack_loop = 1;
Xe_s = length(Xe);
Xb_s = length(Xb);
c = 0;

fprintf('\n\n1. The LP problem is given by...........\n\n')
Ct, A, b

fprintf('\n\n2. Initial Basic Feasible solution...........\n\n')
Binv = inv(B);
bnot = Binv*b;

for i = 1:1:Xe_s
   E(:,i)   = A(:,(Xe(i,1))); 
   Cet(1,i) = Ct(1,(Xe(i,1)));  
end

for i = 1:1:Xb_s
   Cbt(1,i) = Ct(1,(Xb(i,1)));  
end

Xb, Xe, B, Binv, bnot, E

fprintf('\n\nPHASE1 start............................\n\n')

while (art_included == 1)
c = c + 1;
    fprintf('\n\nIteration number: %d........\n\n',c-1)
for i = 1:1:Xb_s
   B(i,:) = A(:,(Xb(i,1)));  
end
B = B';
Binv = inv(B);
bnot = Binv*b;

for i = 1:1:Xe_s
   E(:,i)   = A(:,(Xe(i,1))); 
   Cet(1,i) = Ct(1,(Xe(i,1)));  
end

for i = 1:1:Xb_s
   Cbt(1,i) = Ct(1,(Xb(i,1)));  
end
fprintf('\n\n1. Reduced cost analysis.......\n\n')
Xb,Xe,B, Binv, bnot, E, Cbt, Cet
Cet_not = Cet - Cbt*Binv*E
min1 = min(Cet_not);
z = 0;

fprintf('\n\n')
for i = 1:1:Xe_s
   if (Cet_not(1,i)) < 0
       fprintf('Negative at %d, ',i);
       
   else
      fprintf('Positive at %d, ',i);
      z = z + 1;
      
   end
end
fprintf('\n')
if (z < Xe_s)
d = 10;    
for i = 1:1:Xe_s
   if (min1 - Cet_not(1,i)) == 0
      % fprintf('\n\n2. Min was found at position %d with a value of %d\n',i,min1);
      if (d == 10)
        a = i;
        d = 0;
    end
    d = 1;
       
   end
end
min1_pos = a;
x_into_basis = Xe(a,1);
fprintf('\n3. Corresponding X value in Xe to enter basis Xb: X%d\n',x_into_basis)

neg = 0;
positive = 0;
z = 0;

    P = Binv*A(:,x_into_basis)    
    bnot = Binv*b

for i = 1:1:Xb_s
   
   xmin_matrix(1,i) = bnot(i,1) / P(i,1);
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%   
%    if (a(1,i) < 0)
%        neg = neg + 1;
%        a(1,i) = 3000;
%    end
%     if (a(1,i) > 0)
%        positive = positive + 1;
%     end
    
     if P(i,1) < 0
       bnot(i,1) = 3000;
       P(i,1) = 1;
   
   end
   
   if bnot(i,1) < 0
       bnot(i,1) = 3000;
       P(i,1) = 1;
   
   end
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
   a(1,i) = bnot(i,1) / P(i,1);
   
   if (a(1,i) < 0)
       neg = neg + 1;
       a(1,i) = 3000;
   end
    if (a(1,i) > 0)
       positive = positive + 1;
    end


end
fprintf('\n\n4. The X%d_minimum matrix can be given by:',x_into_basis)
xmin_matrix

if (neg == Xb_s)
    fprintf('\n\nProblem is Unbounded!!!!!!!!\n\n')
    slack_loop = 0;
    art_included = 0;
    
end

min2 = min(a);
d = 10;
for i = 1:1:Xb_s
   if (min2 - a(1,i)) == 0
      % fprintf('\n\nMin found at: %d\n',i);
      % min2_pos = i;
     if (d == 10)
        min2_pos = i;
        d = 0;
    end
    d = 1;  
   end
end

fprintf('\n\n5. The minimum of the matrix was found as %d at position %d.\n',min2,min2_pos)
s = Xb(min2_pos,1);
fprintf('\n\n6. The value that will leave the basis is X%d and replaced by X%d.\n',s,x_into_basis)

Xe(min1_pos,1)  = Xb(min2_pos,1);

Xb(min2_pos,1) = x_into_basis;
Xb = sort(Xb)
Xe = sort(Xe)

else

    fprintf('\n\n\n\n1. Optimum point reached where "Cet_not > 0" !!\n')
    Cet_not
    fprintf('\n\n2. Please edit variables of PHASE2 and solve for optimum X points.....\n\n')
    
    art_included = 0;
    Xe = Xe;
    Xb = Xb;
    B_new = B;
 

end


end

%%
clear all
clc
slack_loop = 1;
%---------------------------------------------------------------------
%EXAMPLE
% Xb = [1;2]
% Xe = [3;4]
% A  = [1 -1 1 0;3 2 0 -1];
% b  = [1;6];
% Ct = [1 1 0 0];


%EXAMPLE2 (diagrams)
% Xb = [3;4]
% Xe = [1;2]
% A  = [1 2 1 0;2 1 0 1];
% b  = [4;5];
% Ct = [-1 -2 0 0];


%EXAMPLE3 (diagrams)
% Xb = [3;4]
% Xe = [1;2]
% A  = [1 2 1 0 0 ;];
% b  = [4;5];
% Ct = [-1 -2 0 0];



%EXAMPLE4 (diagrams)
% Xb = [1;2]
% Xe = [3;4]
% A  = [1 2 -1 0;2 1 0 -1];
% B = [1 2;2 1]
% b  = [4;5];
% Ct = [-1 -1 0 0];


%EXAM 2011 P4
A  = [1 2 5 0 1;1 1 1 -1 0];
b  = [10;1];
Ct = [1 -2 1 0 0];
Xb = [3;4];
Xe = [1;2;5];


%EXAM 2009 part2
% A  = [1 1 1 1 0;3 2 1 0 1];
% b  = [1575;1850];
% Ct = [-1000 -750 -250 0 0];
% Xb = [4;5];
% Xe= [1;2;3];


%EXAM 2009 PART2 TIAAN
% Xb = [4;5]
% Xe = [1;2;3]
% A = [1 1 1 1 0;3 2 1 0 1]
% b = [1125;2750]
% Ct = [-1000 -750 -250 0 0]


%EXAM 2009 PART2
% Xb = [4;5]
% Xe = [1;2;3]
% A = [1 1 1 -1 0;3 2 1 0 -1]
% b = [1125;2750]
% Ct = [-1000 -750 -250 0 0]


%EXAM 2011 P1
% A  = [11.3 9 18.3 1 0 0;0.9 0 0.7 0 -1 0;4 15 30 0 0 -1]
% b  = [10;0.8;15];
% Ct = [4.5 3.8 2.6 0 0 0];
% Xb = [1;3;7];
% Xe = [2;4;5;6];
% B = [11.3 18.3;0.9 0.7;4 30];


% EXAM 2011 P3
% A  = [-2 -1 1 1 0 0;-1 2 -1 0 1 0;-3 1 0 0 0 1]
% b  = [1;2;3];
% Ct = [-1 2 1 0 0 0];
% Xb = [2;3;6];
% Xe = [1;4;5];



%PROBLEM1
% Xb = [3;4];
% Xe = [1;2;5];
% A = [0.1 0.2 0.4 -1 0;0.5 0.3 0.4 0 -1];
% b = [30;40];
% Ct = [150 100 200 0 0];


% %PROBLEM2 - dual!!
%    A = [1 9 -1 0;1 5 0 -1];
%    b = [8;5];
%    Ct = [6 45 0 0];
%    Xb = [2;3];
%    Xe = [1;4];
%    B = [1 0;0 1];

% %PROBLEM2
%     A = [1 1 1 0; 9 5 0 1];
%     b = [6;45];
%     Ct = [-8 -5 0 0];
%     Xb = [3;4];
%     Xe = [1;2];
%     B = [1 0;0 1];


%PROBLEM3
%   Xb = [1;8;9]
%   Xe = [2;3;4;5;6;7]
%   A = [0.1 0.1 0.4 0.6 0.3 0.3 0.3 0.5 0.2;0.1 0.3 0.5 0.3 0.3 0.4 0.2 0.4 0.3;0.8 0.6 0.1 0.1 0.4 0.3 0.5 0.1 0.5]
%   b = [30;30;40]
%   Ct = [4.1 4.3 5.8 6 7.6 7.5 7.3 6.9 7.3]



%PROBLEM4
% Xb = [4;5;6]
% Xe = [1;2;3]
% A = [2 3 4 1 0 0;3 4 6 0 1 0;1 1 3 0 0 1]
% b = [560;690;180]
% Ct = [-100 -200 -400 0 0 0]

%PROBLEM5
% Xb = [10;11;12;13;14;15]
% Xe = [1;2;3;4;5;6;7;8;9]
% A = [1 1 1 0 0 0 0 0 0 1 0 0 0 0 0;...
%      0 0 0 1 1 1 0 0 0 0 1 0 0 0 0;...
%      0 0 0 0 0 0 1 1 1 0 0 1 0 0 0;...
%      1 0 0 1 0 0 1 0 0 0 0 0 1 0 0;...
%      0 1 0 0 1 0 0 1 0 0 0 0 0 1 0;...
%      0 0 1 0 0 1 0 0 1 0 0 0 0 0 1]
% b = [150;70;120;130;110;180]
% Ct = [-450 -375 -675 -500 -400 -750 -525 -425 -700 0 0 0 0 0 0]


%PROBLEM6
% Xb = [4;5;6]
% Xe = [1;2;3]
% A = [-1 2 0 1 0 0; 0 -1 1 0 1 0; 1 2 3 0 0 1]
% b = [0;0;35]
% Ct = [-10 -36 -44 0 0 0]

   
%PROBLEM7
% Xb = [4;5]
% Xe = [1;2;3]
% A = [2 3 1 1 0;1 4 3 0 1]
% b = [10;15]
% Ct = [-6 -4 -5 0 0]


%BEALES CYSLING EXAMPLE
%Xb = [5;6;7]
%Xe = [1;2;3;4]
%A = [1/4 -60 -1/25 9 1 0 0;1/2 -90 -1/50 3 0 1 0;0 0 1 0 0 0 1]
%b = [0;0;1]
%Ct = [-3/4 150 -1/50 6 0 0 0]

%EXAM 2011 problem 1 (loose paper) - dual!!
%    A = [0.3 0.4 0.07 1 0;0.4 0.4 0.04 0 1];
%    b = [70;100];
%    Ct = [-0.1714 -0.25714 -0.0285 0 0];
%    Xb = [4;5];
%    Xe = [1;2;3];
%    B = [1 0;0 1];


 %EXAM 2009 part2
%     1 2 3 4 5 6 7 8 9 10
% A  = [1 1 1 0 0 0 0 0 0 1 0 0 0 0 0 0 0 0;...
%       0 0 0 1 1 1 0 0 0 0 1 0 0 0 0 0 0 0;...
%       0 0 0 0 0 0 1 1 1 0 0 1 0 0 0 0 0 0;...
%       1 0 0 1 0 0 1 0 0 0 0 0 1 0 0 0 0 0;...
%       0 1 0 0 1 0 0 1 0 0 0 0 0 1 0 0 0 0;...
%       0 0 1 0 0 1 0 0 1 0 0 0 0 0 1 0 0 0;...
%       3 2 1 0 0 0 0 0 0 0 0 0 0 0 0 1 0 0;...
%       0 0 0 3 2 1 0 0 0 0 0 0 0 0 0 0 1 0;...
%       0 0 0 0 0 0 3 2 1 0 0 0 0 0 0 0 0 1;...
%       1/400 1/400 1/400 -1/600 -1/600 -1/600 0 0 0 0 0 0 0 0 0 0 0 0;...
%       0 0 0 1/600 1/600 1/600 -1/300 -1/300 -1/300 0 0 0 0 0 0 0 0 0;...
%       ];
%   
% b  = [400;600;300;600;500;325;600;800;375;0;0];
% Ct = [-1000 -750 -250 -1000 -750 -250 -1000 -750 -250 0 0 0 0 0 0 0 0 0];
% Xb = [1;4;10;11;12;13;14;15;16;17;18];
% Xe = [2;3;5;6;7;8;9];







%-----------------------------------------------------------------
fprintf('\n\n1. This is the standard form...........\n\n')
Ct, A, b
Xe_s = length(Xe);
Xb_s = length(Xb);

fprintf('\n\nPHASE2.................................................:\n\n')
c = 0;

while (slack_loop == 1);
    pause()  
c = c + 1;
    fprintf('\n\nIteration number: %d.....................................\n\n',c-1)
for i = 1:1:Xb_s
   B(i,:) = A(:,(Xb(i,1)));  
end
B = B'; 
Binv = inv(B);
bnot = Binv*b;

for i = 1:1:Xe_s
   E(:,i)   = A(:,(Xe(i,1))); 
   Cet(1,i) = Ct(1,(Xe(i,1)));  
end

for i = 1:1:Xb_s
   Cbt(1,i) = Ct(1,(Xb(i,1)));  
end
fprintf('\n\n1. Reduced cost analysis.......\n\n')
Xb, Xe, B, Binv, bnot, E, Cet, Cbt
%pause()  
Cet_not = Cet - Cbt*Binv*E
min1 = min(Cet_not);
z = 0;

for i = 1:1:Xe_s
   if (Cet_not(1,i)) < 0
       fprintf('Negative at %d, ',i);
       
   else
      fprintf('Positive at %d, ',i);
      z = z + 1;
      
   end
end
fprintf('\n')
if (z < Xe_s)
    
for i = 1:1:Xe_s
   if (min1 - Cet_not(1,i)) == 0
       fprintf('\n\n2. Min was found at position %d with a value of %d\n',i,min1);
       a = i;
       
   end
end
min1_pos = a;
x_into_basis = Xe(a,1);
fprintf('\n3. Corresponding X value in Xe to enter basis Xb: X%d\n',x_into_basis)

neg = 0;
positive = 0;
z = 0;

    P = Binv*A(:,x_into_basis)    
    bnot = Binv*b

for i = 1:1:Xb_s
    
   
   xmin_matrix(1,i) = bnot(i,1) / P(i,1);
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%   
   if P(i,1) < 0
       bnot(i,1) = 3000;
       P(i,1) = 1;
   
   end
   
   if bnot(i,1) < 0   
       bnot(i,1) = 3000;
       P(i,1) = 1;
   
   end
 %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%     
       
   a(1,i) = bnot(i,1) / P(i,1);
   
   if (a(1,i) < 0)
       neg = neg + 1;
       a(1,i) = 3000;
   end
    if (a(1,i) > 0)
       positive = positive + 1;
    end
end
fprintf('\n\n4. The X%d_minimum matrix can be given by:',x_into_basis)
xmin_matrix

if (neg == Xb_s)
    fprintf('\n\nProblem is Unbounded!!!!!!!!\n\n')
    slack_loop = 0;
    art_included = 0;
    
end
    
min2 = min(a);
d = 10;
for i = 1:1:Xb_s
   if (min2 - a(1,i)) == 0
     % fprintf('\n\nMin found at: %d\n',i);
       %min2_pos = i
       
    if (d == 10)
        min2_pos = i;
        d = 0;
    end
    d = 1;
   end
end

fprintf('\n\n5. The minimum of the matrix was found as %d at position %d.\n',min2,min2_pos)
s = Xb(min2_pos,1);
fprintf('\n\n6. The value that will leave the basis is X%d and replaced by X%d.\n',s,x_into_basis)

Xe(min1_pos,1)  = Xb(min2_pos,1);
Xe = sort(Xe)
Xb(min2_pos,1) = x_into_basis;
Xb = sort(Xb)

else

    fprintf('\n\n\n\nOptimum point reached where "Cet_not > 0" !!\n')
    Cet_not
    fprintf('\n\n\n\nOptimum X points and positions are:\n')
    Optimal_x_points = Binv*b
    x_positions = Xb
    
    art_included = 0;
    slack_loop = 0;
      

end


end

%%






