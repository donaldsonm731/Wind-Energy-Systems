%% NACA 0012
m = 0;    % Camber
p = 0;    % Position
t = 0.12; % Thickness
%% NACA 4415
m = 0.04; % Camber
p = 0.4;  % Position
t = 0.15; % Thickness
%%
% Sets up values for x in increments of 0.01
length = 1000;
yc = zeros(1,length);
theta = zeros(1,length);
x = 0:0.001:1;

% Using a for loop to calculate yc, theta, yt
for i = 1:length
   % The if statment allows us to calculate yc and theta with the condition
   % for whe x < p and and x is greater than p.
   if (x(i) >= 0) && (x(i) <= p) 
      yc(i) = m*(2*p*x(i) - x(i)^2)/p^2;
      theta(i) = atan((2*m*(p-x(i)))/p^2);
      
   else
      yc(i) = m*(1-2*p + 2*p*x(i) - x(i)^2)/(1-p)^2;
      theta(i) = atan((2*m*(p-x(i)))/(1-p)^2);
      
   end
   
   % the yt is then calculated 
   yt(i) = (t/0.2)*(0.2969*sqrt(x(i)) - 0.1260*x(i) - 0.3516*x(i)^2 ...
                                   + 0.2843*x(i)^3  - 0.1015*x(i)^4);
   % The x and y coordinates for the lower and upper bounds can then be 
   % calculated and plotted.
   X_U(i) = x(i) - yt(i)*sin(theta(i));
   X_L(i) = x(i) + yt(i)*sin(theta(i));
   
   Y_U(i) = yc(i) + yt(i)*cos(theta(i));
   Y_L(i) = yc(i) - yt(i)*cos(theta(i));
end

plot(X_U,Y_U)
hold on
plot(X_L, Y_L)
hold off
axis([0 1 -0.4 0.4])
xlabel('X')
ylabel('Y')
title('NACA 4415 Airfoil Plot')
%title('NACA 0012 Airfoil Plot')
