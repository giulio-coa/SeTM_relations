clear all
clear
clc

format long e
v_e = [-4 -3.5 -3 -2 -1 0 0.2 0.4 0.6 0.8 1 1.5 2];
x = -4:0.25:2;
R = 9.9*10^3;

% DATI CARATTERISTICA STATICA DIODO
v_u = [-0.046*10^(-3) -0.043*10^(-3) -0.038*10^(-3) -0.032*10^(-3) -0.027*10^(-3) 0.001*10^(-3) 2.067*10^(-3) 45.306*10^(-3) 0.177*10^(-3) 344*10^(-3) 526*10^(-3) 997*10^(-3) 1.477];

v_D = v_e - v_u;
i_D = v_u./R;

y = spline(v_D, i_D, x);

i_D'
plot(v_D, i_D, 'r*', x, y, 'b')
xlabel('v_D [V]]')
ylabel('i_D [A]]')
grid on

% DATI CARATTERISTICA STATICA DIODO DI ZENER
figure()

v_u = [-3.31*10^(-3) -2.81*10^(-3) -2.32*10^(-3) -1.33*10^(-3) -0.37*10^(-3) 0.006*10^(-3) 0.019*10^(-3) 0.966*10^(-3) 43.5*10^(-3) 191*10^(-3) 373*10^(-3) 847*10^(-3) 1.33];

v_D = v_e - v_u;
i_D = v_u./R;

y = spline(v_D, i_D, x);

i_D'
plot(v_D, i_D, 'r*', x, y, 'b')
xlabel('v_D [V]]')
ylabel('i_D [A]]')
grid on
