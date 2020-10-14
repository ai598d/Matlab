%% Main Function 
close all;
clear;
clc;


%% Design parameters from the TE table
% [TE] = [N G L_te I_mx V_mx T_h alpha roh k]
format long

TE1 = [125 0.00184 .0244  8.75  14.1 310.4 2.02e-4 1.01e-5 1.51];
TE2 = [125 0.00282 .0244  12.18 13.4 317.3 2.02e-4 1.01e-5 1.51];
TE3 = [31  0.00473 .01565 24.13  3.6 305.4 2.02e-4 1.01e-5 1.51];

%% bound and arguments for fmincon
% design variables x(1)= I_te , x(2)= N_tep, x(3) = N_tes 

 
LB1=[0,1,1]; UB1=[8.75,50,50] ;              % bounds for TE 1
LB2=[0,1,1]; UB2=[12.18,50,50];              % bounds for TE 1
LB3=[0,1,1]; UB3=[24.13,50,50];              % bounds for TE 1

x01 = (UB1-LB1)/2;                           % Initial guess for TE1
x02 = (UB2-LB2)/2;                           % Initial guess for TE1
x03 = (UB3-LB3)/2;                           % Initial guess for TE1

A=[]; Aeq=[]; b=[]; beq=[];                  % fmincon parameters
j=1;                                         % counter

%% calling fmincon with loop for TE 1

for i=0:0.02:1                           % loop for w
    w1=i; w2=1-i;                        % Such that w1+w2=1;
    [xopt,fopt]=fmincon('multobj2_obj_TE1',x01,A,Aeq,b,beq,LB1,UB1,...
        'multobj2_nonlcon_TE1',[],w1,w2);
    
%     u1(j) = xopt(1)+2*xopt(2);            % 1st objfunc(total height) array with optimized values
%     u2(j) = (4/3)*pi*(xopt(2)-t)^3;       % 2nd objfunc(Volume) array with optimized values
    j=j+1;                                % counter increament
end


%% plots for TE 1
figure  % unscaled figure with all points
plot(u1,u2,'*'); xlabel('\mu_1 (height)');ylabel('\mu_2 (vol/capacity)')     % pareto frontier plot


figure  % scaled within resonable pareto frontier
plot(u1,u2,'*'); xlabel('\mu_1 (height)');ylabel('\mu_2 (vol/capacity)')     % pareto frontier plot
xlim([14.2596 14.2612])
ylim([39.759082 39.759089])