clc;
clear;
close all;

%%% 1.
% specs steady-error 5% ,   44 < P.M < 46
G_1 = tf(1,[1 12 36]);
figure(1)
margin(G_1)

K_1 = 750;
%%% x-(-180) = 45 => x = -135
omega_1 = 14.4; % center frequency x-(-180) = 45 x=-135 從Phase圖上點找出
attenuation_db = -47.8; % 再從GAIN圖wn=14.4點找出Magnitude大小
z = omega_1/10;
alpha = 10^(attenuation_db/20);
p = z/alpha;
Gs_1 = tf([1 z],[1 p]);
L = K_1 * (p/z) * G_1 * Gs_1;
figure(2)
margin(L)



%% 
% 2.
% specs 54 < P.M < 56
G_2 = tf(18.75,[1 12 18.75]);
figure(3)
margin(G_2)
K = 53;
omega_2 = 10.2; % center frequency x-(-180) = 55  x=-125 從Phase圖上點找出
attenuation_db2 = -18; % 再從GAIN圖wn=2點找出Magnitude大小
z = omega_2/10;
alpha = 10^(attenuation_db2/20);
p = z/alpha;
Gs_2 = tf([1 z],[1 p]);
L = K * (p/z) * G_1 * Gs_2;
figure(4)
margin(L)

%%
% 3.
G_3 = tf(1,[1 10]);
Gc_3 = tf(85,[1 0]);
figure(5)
margin(G_3*Gc_3)
L = feedback(G_3*Gc_3,1);
stepinfo(L)

%%
% 4.
G_4 = tf([1 2],[1 6 14 8]);
figure(6)
rlocus(G_4)
sgrid(0.707,10^4)
title('4.(1) Root Locus')
fprintf('4. :\n')
fprintf('When zeta = 0.707, K = 3.17\n')
fprintf('------------------------------------\n')

%%
% 5.
% specs  P.O ≤ 5%, 𝑇𝑠 ≤ 5 s
G_5 = tf([0.8*25 0.8*25],[1 2 25]);
actuator = tf(1,[1 0]);
zeta = 0.8;
x = 100 * exp(-pi*zeta/sqrt(1-zeta^2))
z = 2; % select z
p = 15; % select p > z
Gc_5 = tf([1 z],[1 p]);
L_5 = G_5 * Gc_5;
figure(7)
rlocus(L)
sgrid(zeta,10^4)
K_5 = 50;
L_5 = K_5 * L_5;
T = feedback(L_5,1);
S = stepinfo(T)

%%
% 6.
% specs steady-state error less than 0.10A
G_6 = tf(1,[1600 80 1],'InputDelay',50);
figure(8)
margin(G_6)
K_6 = 15;
phi_m = 45 + 180; % Select additional phase 𝜙𝑚 < 70 to be added to the phase margin
phi_m = phi_m*pi/180; % degree to rad
alpha = (1+sin(phi_m))/(1-sin(phi_m));
wm = 9.17;
p = wm*alpha^0.5;
z = p/alpha;
Gs_6 = tf([1 z],[1 p]);
L_6 = K_6 * (p/z) * G_6 * Gs_6;
figure(9)
margin(L_6)
T_6 = feedback(L_6,1);
S_6 = stepinfo(T_6)
steady_error_6 = evalfr(T_6-1,0)

%%
% 7.
% specs 40° ≥ 𝑃.𝑀. ≥ 30° , 𝜔𝐵 = 0.8 rad/s
G_7 = tf(0.2,[6 7 1 0]);
figure(10)
margin(G_7)
K = 1;
phi_m = 35-40;
phi_m = phi_m*pi/180;
alpha = (1+sin(phi_m))/(1-sin(phi_m));
wm = 0.148;
p = wm*alpha^0.5;
z = p/alpha;
Gs_7 = tf([1 z],[1 p]);
L = K * (p/z) * G_7 * Gs_7;
figure(11)
margin(L)
%%
% 8.
% specs 59° ≤ 𝑃. 𝑀 ≤ 61°
G_8 = tf(1,[1 4 3]);
z = 2;
Ki_8 = tf(2,[1 0]);
Kp_8 = 1;
Gs_8 = Kp_8 + Ki_8 ;
L = G_8 * Gs_8;
figure(12)
margin(L)

Kp = 0.7;
Gs =  Kp + Ki_8;
L = G_8 * Gs;
figure(13)
margin(L)
fprintf('8.:\n')
fprintf('Kp = 0.7')
