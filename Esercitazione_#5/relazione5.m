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
R_5 = 2.2 * k;
R_6 = 10 * k;
R_7 = 10 * k;
R_8 = 10 * k;
R_9 = 22 * k;
R_10 = 100 * k;
R_11 = 1 * k;
R_12 = 100;

% CONDENSATORI

C_1 = 100 * n;
C_2 = 100 * n;
C_3 = 15 * p;
C_4 = 100 * n;
C_5 = 100 * n;
C_6 = 100 * n;
C_7 = 100 * n;

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
beta = 0;

A_v = 0
R_in = 0
R_out = 0

% FUNZIONI

function result = parallel(x, y)
	result = (x * y) / (x + y);
end
