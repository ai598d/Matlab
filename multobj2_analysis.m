function [Q, P, COP, Q_te, V_te] = multobj2_analysis(x,y)

% Function input  : x = [I_te N_tep N_tes] 
%                 : y = [N G L_te I_mx V_mx T_h alpha roh k ]  
%
% Function Return : [Q, P, COP, Q_te, V_te]
% 

% conditions
L_win    = 1;               % length of window

T_c      = 297;             % cold side temp

% TE unit paramter values
N     = y(1);
G     = y(2);
L_te  = y(3);
I_mx  = y(4);
V_mx  = y(5);
T_h   = y(6);
alpha = y(7);
roh   = y(8);
k     = y(9);

% design variables
I_te  = x(1); 
N_tep = x(2); 
N_tes = x(3);


DT = T_h -T_c ;

  

% calculate Q_te

Q_te = (2*N)*((alpha*I_te*T_c)-((I_te^2 *roh)/(2*G))-(k*DT*G));


% calculate V_te

V_te = (2*N)*(((I_te * roh)/(G))+(alpha*DT));


% calculate Q

Q = N_tep.*N_tes* Q_te ;

% calculate P

P = N_tep.*N_tes * I_te * V_te ;

% calculate cop

COP = Q/P ;






end