%% 
% Problem 1
U = 1:0.1:30; % m/s
rho = 1.225; % kg/m^3
PD = 0.5.*rho.*U.^3; % W/M^2

plot(U,PD)
xlabel("Wind Veloctiy (m/s)");
ylabel("Power Density (W/m^2)");

%%
% Problem 2
rho = 1.225;
U = [10, 20, 30];
D = 10:50;
P1 = (rho.*pi.*D.^2/8).*U(1)^3;
P2 = (rho.*pi.*D.^2/8).*U(2)^3;
P3 = (rho.*pi.*D.^2/8).*U(3)^3;

plot(D,P1,D,P2,D,P3)
xlabel("Wind Veloctiy (m/s)");
ylabel("Power (W)");
legend("P1", "P2", "P3");