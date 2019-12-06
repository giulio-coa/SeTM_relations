v_e = [-4 -3.5 -3 -2 -1 0 0.2 0.4 0.6 0.8 1 1.5 2];

% DATI CARATTERISTICA STATICA DIODO
v_u = [-0.046*10^(-3) -0.043*10^(-3) -0.038*10^(-3) -0.032*10^(-3) -0.027*10^(-3) 0.001*10^(-3) 2.067*10^(-3) 45.306*10^(-3) 0.177 0.344 0.526 0.997 1.477];

v_D = v_e - v_u;
v_D = v_D';

eta = 1;
I_S = 1;
V_T = 1;

i_D = I_S*(exp(v_D./(eta*V_T)) - 1);

x = -4:0.25:2;
y = spline(v_D, i_D, x);

i_D
plot(v_D, i_D, 'r*', x, y, 'b')
grid on

% DATI CARATTERISTICA STATICA DIODO DI ZENER
figure()

v_u = [-0.046*10^(-3) -0.043*10^(-3) -0.038*10^(-3) -0.032*10^(-3) -0.027*10^(-3) 0.001*10^(-3) 2.067*10^(-3) 45.306*10^(-3) 0.177 0.344 0.526 0.997 1.477];

v_D = v_e - v_u;
v_D = v_D';

eta = 1;
I_S = 1;
V_T = 1;

i_D = I_S*(exp(v_D./(eta*V_T)) - 1);

x = -4:0.25:2;
y = spline(v_D, i_D, x);

i_D
plot(v_D, i_D, 'r*', x, y, 'b')
grid on
