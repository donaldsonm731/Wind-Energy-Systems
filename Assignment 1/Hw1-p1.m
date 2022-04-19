U = 1:0.1:30; % m/s
rho = 1.225; % kg/m^3
PD = 0.5*rho*U^3; % W

plot(U,PD)
