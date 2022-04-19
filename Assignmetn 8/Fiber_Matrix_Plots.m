% Basalt
E_B = 93; % GPa
v_B = 0.26;
rho_B = 2750; % kg/m^3

% Epoxy
E_E = 3.45; %GPa
v_E = 0.35;
rho_E = 1200; % kg/m^3

% Polyimide
E_Pi = 2.76; %GPa
v_Pi = 0.33;
rho_Pi = 1400; % kg/m^3

% Polyester
E_PE = 2.76; %GPa
v_PE = 0.4;
rho_PE = 1250; % kg/m^3

% Aluminum
E_A = 72.4; %GPa
v_A = 0.3;
rho_A = 2700; % kg/m^3

% Titanium
E_T = 110; %GPa
v_T = 0.3;
rho_T = 4500; % kg/m^3

% Fiber Volume Fraction
V_f = 0.05:0.05:0.95;
V_m = 1 - V_f;

%% Longitudinal Modulus (E_x)
E_x_BE = E_B*V_f + E_E*V_m;
E_x_BPi = E_B*V_f + E_Pi*V_m;
E_x_BPE = E_B*V_f + E_PE*V_m;
E_x_BA= E_B*V_f + E_A*V_m;
E_x_BT = E_B*V_f + E_T*V_m;

subplot(2,3,1)
plot(V_f, E_x_BE,V_f, E_x_BPi,V_f, E_x_BPE,V_f, E_x_BA,V_f, E_x_BT)
title('E_x Vs. V_f')
legend('Basalt/Epoxy','Basalt/Polymide', 'Basalt/Polyester', 'Basalt/Aluminum', 'Basalt/Titanium')

%% Transverese Modulus (E_y)
E_y_BE = (E_B*E_E)./(E_B*V_m + E_E*V_f);
E_y_BPi = (E_B*E_Pi)./(E_B*V_m + E_Pi*V_f);
E_y_BPE = (E_B*E_PE)./(E_B*V_m + E_PE*V_f);
E_y_BA = (E_B*E_A)./(E_B*V_m + E_A*V_f);
E_y_BT = (E_B*E_T)./(E_B*V_m + E_T*V_f);

subplot(2,3,2)
plot(V_f, E_y_BE,V_f, E_y_BPi,V_f, E_y_BPE,V_f, E_y_BA,V_f, E_y_BT)
title('E_y Vs. V_f')
%legend('Basalt/Epoxy','Basalt/Polymide', 'Basalt/Polyester', 'Basalt/Aluminum', 'Basalt/Titanium')
%% Major Poissons Ration (v_xy)
v_xy_BE = v_B*V_f + v_E*V_m;
v_xy_BPi = v_B*V_f + v_Pi*V_m;
v_xy_BPE = v_B*V_f + v_PE*V_m;
v_xy_BA = v_B*V_f + v_A*V_m;
v_xy_BT = v_B*V_f + v_T*V_m;

subplot(2,3,3)
plot(V_f, v_xy_BE,V_f, v_xy_BPi,V_f, v_xy_BPE,V_f, v_xy_BA,V_f, v_xy_BT)
title('v_xy Vs. V_f')
%legend('Basalt/Epoxy','Basalt/Polymide', 'Basalt/Polyester', 'Basalt/Aluminum', 'Basalt/Titanium')
%% Minor Poissons Ration (v_yx)
%(EY/EX)*V_xy
v_yx_BE = v_xy_BE.*E_y_BE./E_x_BE;
v_yx_BPi = v_xy_BPi.*E_y_BPi./E_x_BPi;
v_yx_BPE = v_xy_BPE.*E_y_BPE./E_x_BPE;
v_yx_BA = v_xy_BA.*E_y_BA./E_x_BA;
v_yx_BT = v_xy_BT.*E_y_BT./E_x_BT;

subplot(2,3,4)
plot(V_f, v_yx_BE,V_f, v_yx_BPi,V_f, v_yx_BPE,V_f, v_yx_BA,V_f, v_yx_BT)
title('v_yx Vs. V_f')
%legend('Basalt/Epoxy','Basalt/Polymide', 'Basalt/Polyester', 'Basalt/Aluminum', 'Basalt/Titanium')
%% Shear Modulus (G)
G_f = E_B/(2*(1+v_B));

G_E = E_E/(2*(1+v_E));
G_Pi = E_Pi/(2*(1+v_Pi));
G_PE = E_PE/(2*(1+v_PE));
G_A = E_A/(2*(1+v_A));
G_T = E_T/(2*(1+v_T));

G_BE = (G_f*G_E)./(G_f*V_m + G_E*V_f);
G_BPi = (G_f*G_Pi)./(G_f*V_m + G_Pi*V_f);
G_BPE = (G_f*G_PE)./(G_f*V_m + G_PE*V_f);
G_BA = (G_f*G_A)./(G_f*V_m + G_A*V_f);
G_BT = (G_f*G_T)./(G_f*V_m + G_T*V_f);

subplot(2,3,5)
plot(V_f, G_BE,V_f, G_BPi,V_f, G_BPE,V_f, G_BA,V_f, G_BT)
title('G Vs. V_f')
%legend('Basalt/Epoxy','Basalt/Polymide', 'Basalt/Polyester', 'Basalt/Aluminum', 'Basalt/Titanium')
%% Density 
Pf_P_BE = E_B*V_f./E_x_BE;
Pf_P_BPi = E_B*V_f./E_x_BPi;
Pf_P_BPE = E_B*V_f./E_x_BPE;
Pf_P_BA = E_B*V_f./E_x_BA;
Pf_P_BT = E_B*V_f./E_x_BT;

subplot(2,3,6)
plot(V_f, Pf_P_BE,V_f, Pf_P_BPi,V_f, Pf_P_BPE,V_f, Pf_P_BA,V_f, Pf_P_BT)
title('P_f/P Vs. V_f')
%legend('Basalt/Epoxy','Basalt/Polymide', 'Basalt/Polyester', 'Basalt/Aluminum', 'Basalt/Titanium')



