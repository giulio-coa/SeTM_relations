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

% PUNTO 2.2.2

x = [100, 1*k, 10*k, 100*k]; % vettore con le frequenze
h_1 = R_i * A_v * (R_5 + R_10);
h_2 = R_u * R_6 + R_i * (R_5 + R_10);
h_3 = R_i * R_u * R_6 * (R_5 + R_10);
H = tf([h_1 0], [h_3 h_2 1]); % funzione di trasferimento
magnitude = bode(H, x);
magnitude = squeeze(magnitude);
bode(H, 'b')
hold on
bode(H, x, 'r*')
grid on
