clear all
clear
clc

C = 10 * 10^(-9);
R = 10^3;
C_cavo = 100 * 10^(-12);

% DATI PRIMO FILTRO PASSA-BASSO

x = [100, 300, 500, 1000, 3000, 5000, 10000, 15000, 16000, 18000, 20000, 25000, 30000, 1000000]; % vettore con le frequenze
h = R*(C + C_cavo);
H = tf([0 1], [h 1]); % funzione di trasferimento
bode(H, 'b')
hold on
bode(H, x, 'r*')
grid on

% DATI SECONDO FILTRO PASSA-BASSO

figure()
x = [1000, 2000, 3000, 5000, 7000, 7500, 8300, 8500, 10000, 12000, 14000, 15000, 20000, 30000, 50000]; % vettore con le frequenze
h = R*(2*C + C_cavo);
H = tf([0 1], [h 1]); % funzione di trasferimento
bode(H, 'b')
hold on
bode(H, x, 'r*')
grid on

% DATI FILTRO PASSSA-ALTO

figure()
x = [100, 5000, 8000, 10000, 15000, 16000, 17000, 18000, 20000, 25000, 29000, 1000000]; % vettore con le frequenze
h_1 = R*C;
h_2 = R^2*C*C_cavo;
h_3 = R*(2*C_cavo + C);
h_4 = R^2*C_cavo*(1 + C);
H = tf([h_2 h_1 0], [h_4 h_3 1]); % funzione di trasferimento
bode(H, 'b')
hold on
bode(H, x, 'r*')
grid on
