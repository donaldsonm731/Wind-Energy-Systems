Ex = 57.18 *10^9;
Ey = 8.17 * 10^9;
G = 3.037 * 10^9;
Vxy = 0.296;
Vyx = Ey/Ex*Vxy;
%% On-axis Compliance
S = [1/Ex    -Vyx/Ey   0;
     -Vxy/Ex    1/Ey   0;
     0          0    1/G];
 
 %% On-axis Stiffness
 P = 1/(1-Vxy*Vyx);
 
 Q = [P*Ex  P*Vyx*Ex  0;
      P*Vxy*Ey P*Ey   0;
      0        0      G];
  
 %% Off-axis compliance +45 comliance
 T = [0.5 0.5 1;
      0.5 0.5 -1;
      -0.5 0.5 0];
  
 S_45 = T'*S*T;
 %% Off-axis stiffness +45 stiffness
 
R = [0.5 0.5 0.5;
     0.5 0.5 -0.5;
     -1 1 0;];

Q_45 = R'*Q*R;

 %% Off-axis compliance -45 comliance
 T = [0.5 0.5 -1;
      0.5 0.5 1;
      0.5 -0.5 0];
  
 S_N45 = T'*S*T;
 
  %% Off-axis stiffness -45 stiffness
 
R = [0.5 0.5 -0.5;
     0.5 0.5 0.5;
     1 -1 0;];

Q_N45 = R'*Q*R;

%%
disp('On-axis compliance')
disp(S)

disp('On-axis stiffness')
disp(Q)

disp('Off-axis compliance +45 comliance')
disp(S_45)

disp('Off-axis stiffness +45 stiffness')
disp(Q_45)

disp('Off-axis compliance -45 comliance')
disp(S_N45)

disp('Off-axis stiffness -45 comliance')
disp(Q_N45)
 
