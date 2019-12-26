clear all
clear
clc

format long e

% PREFISSI

pico = 10^(-12);
micro = 10^(-6);
n = 10^(-9);
k = 10^3;
M = 10^6;

% CONDENSATORI

C_5 = 10 * n;
C_6 = 10 * n;
C_10 = 3.9 * pico;

% AMPLIFICATORE

A_v = 9.33;
R_i = 10 * k;
R_u = 1 * k;

% PUNTO 2.2.2

x = [300, 1*k, 3*k, 10*k, 30*k, 100*k, 300*k, 1*M]; % vettore con le frequenze
h_1 = R_i * A_v * (C_5 + C_10);
h_2 = R_u * C_6 + R_i * (C_5 + C_10);
h_3 = R_i * R_u * C_6 * (C_5 + C_10);
H = tf([h_1 0], [h_3 h_2 1]); % funzione di trasferimento
magnitude = bode(H, x);
magnitude = squeeze(magnitude)
bode(H, 'b')
hold on
bode(H, x, 'r*')
grid on
