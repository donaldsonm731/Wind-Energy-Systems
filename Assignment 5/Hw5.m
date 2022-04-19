n = 10;
n_i = [.3 .19 .225 .35 .26 .28 .49 .31 .36 .39]*10^6;

m = (1/n)*sum(log10(n_i));

delta = sqrt((1/(n-1))* sum((log10(n_i)-m).^2));

%% Problem 4
S = [40 42 45 50 70 96 110 165 180 200 250];
C = [2510*10^6 316*10^6 110*10^6 25*10^6 0.5*10^6 39800 15900 1590 1000 500 316];

plot(log10(C), S)
title('Stress as a Funtion of the Log of Number of Cycles');
xlabel('Cycles')
ylabel('Stress')
%%
x = (-pi/2)+0.01:0.01:(pi/2)-0.01;
plot(x,tan(x)), grid on
