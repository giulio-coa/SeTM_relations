clear all
clear
clc

format long e

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
beta = R_2 / (R_1 + R_2);

% PUNTO 2.1.2

A_v = beta * A_d / (1 + beta * A_d) / beta
R_in = (R_id + parallel(R_1, R_2)) * (1 + A_d * (parallel(R_2, R_id))/(parallel(R_2, R_id) + R_1))
R_out = parallel((R_o) / (1 + beta * A_d), R_1 + R_2)

% FUNZIONI

function result = parallel(x, y)
	result = (x * y) / (x + y);
end
