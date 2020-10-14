function [c, ceq] = multobj2_nonlcon_TE1(x,w1,w2)

% this constraint function is written for TE 1.
TE1=[125,0.00184000000000000,0.0244000000000000,8.75000000000000,14.1000000000000,310.400000000000,0.000202000000000000,1.01000000000000e-05,1.51000000000000];

[Q, P, COP, Q_te, V_te] = multobj2_analysis(x,TE1);  % calling analysis function with TE 1 values

L_win    = 1;               % length of window
peri_win = 2*(L_win+L_win); % window perimeter
L_te1    = .0244;           % TE 1 length
I_mx1    = 8.75;            % max current for TE1
V_mx1    = 14.1;            % max volt for TE1




I_te  = x(1);
N_tep = x(2);
N_tes = x(3);

c(1) = peri_win - (L_te1*N_tep*N_tes); % total length constraint
c(2) = I_mx1 - I_te;                   % current constraint
c(3) = V_mx1 - V_te;                   % volt constraint

c(4) = 1-Q;                            % absorbed heat constraint
c(5) = 1-P;                            % absorbed power constraint
c(6) = 3-COP;                          % efficncy constraint 

ceq=[];


end