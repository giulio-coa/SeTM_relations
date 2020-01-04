clear all
clear
clc

format short e

% PREFISSI

p = 10^(-12);
n = 10^(-9);
k = 10^3;
M = 10^6;

% RESISTENZE

R_1 = 100 * k;
R_2 = 12 * k;
R_3 = 4.7 * k;
R_4 = 10 * k;
R_9 = 22 * k;
R_10 = 100 * k;

% CONDENSATORI

C_3 = 15 * p;
C_4 = 100 * n;
C_5 = 100 * n;

% AMPLIFICATORE

A_d = 200 * k;
R_id = 1 * M;
R_o = 100;

% PUNTO 2.1.2
beta = R_2 / (R_1 + R_2);
beta_primo = (parallel(R_2, R_id + R_3) + R_o) / (parallel(R_2, R_id + R_3) + R_o + R_1);
R_in_0 = R_id + R_3 + parallel(R_1 + R_o, R_2);

A_v_oo = 1 / beta
A_v = A_d / (1 + beta * A_d)
R_in = R_in_0 * (1 + A_d * beta_primo)
R_out = parallel((R_o) / (1 + beta * A_d), R_1 + R_2)

% PUNTO 2.2.2
beta = - R_9 / R_10;

A_v_oo = 1 / beta
A_v = A_d / (1 + beta * A_d)
R_in = R_9 + (R_o + R_10) / (1 + A_d)
R_out = (R_9 + R_10 + R_o) / (R_9 * (1 + A_d) + R_10 + R_o) * parallel(R_o, R_9 + R_10)

% PUNTO 2.3.2

A_v_S8 = 1
A_v_S9 = 2 / 3 * (1 + R_10 / R_9) - R_10 / R_9
A_v_S10 = 1 / 3 * (1 + R_10 / R_9) - R_10 / R_9
A_v_S11 = - R_10 / R_9

% PUNTO 2.4.2
x = [100, 1*k, 10*k, 100*k]; % vettore con le frequenze

h = R_1 + R_2;
H = tf([0 h], [0 R_2]); % funzione di trasferimento
bode(H, 'b')
hold on
bode(H, x, 'r*')
grid on

% SEZIONE d
figure()

h = C_3 * R_1 * R_2;
H = tf([0 R_1], [h R_2]); % funzione di trasferimento
bode(H, 'b')
hold on
bode(H, x, 'r*')
grid on

% SEZIONE e
figure()

h_1 = C_4 * (R_1 + R_2);
h_2 = C_4 * R_2;
H = tf([h_1 1], [h_2 1]); % funzione di trasferimento
bode(H, 'b')
hold on
bode(H, x, 'r*')
grid on

% SEZIONE f
figure()

h_1 = C_5 * R_4 * (R_1 + R_2);
h_2 = C_5 * R_2 * R_4;
H = tf([h_1 0], [h_2 R_2]); % funzione di trasferimento
bode(H, 'b')
hold on
bode(H, x, 'r*')
grid on

% FUNZIONI

function result = parallel(x, y)
	result = (x * y) / (x + y);
end
