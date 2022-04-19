%% Problem 3 No Wake Rotation
B= 3; 
R = 10;
C_L = 1;
lambda = 7;
alpha = 7;
r_R = 0.1:0.1:1;
lambda_r = lambda*r_R;

phi = atand(2./(3*lambda_r));
theta_p = phi - alpha;
phi_tip = atand(2./(3*lambda));
theta_t = phi - phi_tip;
c = (8*pi()*r_R.*R.*sind(phi))./(3*B*C_L*lambda_r);

%% Problem 4 No Wake Rotation
B= 3; 
R = 20;
C_L = 1;
lambda = 6.5;
alpha = 7;
r_R = [0.05, 0.15, 0.25, 0.35, 0.45, 0.55, 0.65, 0.75, 0.85, 0.95, 1];
lambda_r = lambda*r_R;

%% a). No Wake Rotation
phi = atand(2./(3.*lambda_r));
theta_p = phi - alpha;
phi_tip = atand(2./(3.*lambda));
theta_t = phi - phi_tip;
c = (8*pi().*r_R.*R.*sind(phi))./(3.*B.*C_L.*lambda_r);

%% b). Wake Rotation
phi = 2/3*atand(1./lambda_r);
theta_p = phi - alpha;
phi_tip = 2/3*atand(1./lambda);
theta_t = phi - phi_tip;
c = (8*pi().*r_R)./(B*C_L) .* (1 - cosd(phi));
