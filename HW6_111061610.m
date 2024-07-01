clc;
clear;
close;

%% 第一題
% P8.1
% (a)
num_1a = 1;
den_1a = [0.75 3.25 1];
L1 = tf(num_1a,den_1a);
figure(1)
nyquist(L1)
title('1.(a)')
%(b)
num_1b = [5 7 5];
den_1b = [1 -2 1];
L2 = tf(num_1b,den_1b);
figure(2)
nyquist(L2)
title('1.(b)')
%(c)
num_1c = [1 -8];
den_1c = [1 6 8];
L3 =tf(num_1c,den_1c);
figure(3)
nyquist(L3)
title('1.(c)')
%(d)
num_1d = [20 160];
den_1d = [1 6 8 0];
L4 = tf(num_1d,den_1d);
figure(4)
nyquist(L4)
title('1.(d)')
%% 第二題
% P8.4
Gc = tf([0.5 1],[1]);
G1 = tf([0.2 0.02],[84 19 1]);
G2 = tf([10],[3 1 0]);
H = tf([20],[1 5 12]);
L = Gc * G1 * G2 * H;
figure(5)
bode(L),grid
title('2. Bode')
%% 第三題
% P8.9
% (a)
num_3a = [1];
den_3a = [0.75 3.25 1];
L3 = tf(num_3a,den_3a);
[mag,phase,wout] = bode(L3);
mag = squeeze(mag);
phase = squeeze(phase);
mag = 20*log10(mag);
figure(6)
plot(phase,mag),grid
title('3.(a): logarithmic-magnitude versus phase angle curve')
xlabel('Phase deg')
ylabel('Gain dB')
% (b)
num_3b = [5 7 5];
den_3b = [1 -2 1];
L3b = tf(num_3b,den_3b);
[mag,phase,wout] = bode(L3b);
mag_b = squeeze(mag);
phase_b = squeeze(phase);
mag_b = 20*log10(mag_b);
figure(7)
plot(phase_b,mag_b),grid
title('3.(b): logarithmic-magnitude versus phase angle curve')
xlabel('Phase deg')
ylabel('Gain dB')
%% 第四題
% CP9.3
% (a)
num_4a = [1];
den_4a = [1 0.2];
G4a = tf(num_4a,den_4a);
figure(8)
nichols(G4a,{0,inf})
ngrid
[mag_4a,phase_4a] = margin(G4a);
mag_4a = 20*log10(mag_4a);
hold on
plot([-180,-180+mag_4a],[0,0], Color = 'red')
text(-150,-2,'PM='+string(phase_4a), Color = 'red')
hold off
title('(a): Nichols chart')
fprintf('4.(a): \n')
fprintf('Gain of (a) is '+ string(mag_4a) +'\n')
fprintf('Phase margin of (a) is '+ string(phase_4a) +'\n')


% (b)
num_4b = [1];
den_4b = [1 2 1];
G4b = tf(num_4b,den_4b);
figure(9)
nichols(G4b)
ngrid
[mag_4b,phase_4b] = margin(G4b);
mag_4b = 20*log10(mag_4b);
hold on
plot([-180,-180+mag_4b],[0,0], Color = 'red')
text(-150,-2,'PM='+string(phase_4b), Color = 'red')
hold off
title('(b): Nichols chart')
fprintf('4.(b): \n')
fprintf('Gain of (b) is '+ string(mag_4b) +'\n')
fprintf('Phase margin of (b) is Inf \n')

% (c)
num_4c = [6];
den_4c = [1 6 11 6];
G4c = tf(num_4c,den_4c);
figure(10)
nichols(G4c)
ngrid
[mag_4c,phase_4c] = margin(G4c);
mag_4c = 20*log10(mag_4c);
hold on
plot([-180,-180+mag_4c],[0,0], Color = 'red')
text(-150,-2,'PM='+string(phase_4c), Color = 'red')
hold off
title('(c): Nichols chart')
fprintf('4.(c): \n')
fprintf('Gain of (c) is '+ string(mag_4c) +'\n')
fprintf('Phase margin of (c) is Inf \n')

%% 第五題
% CP7.9
num_5 = [1 2];
den_5 = [1 6 14 8];
G5 = tf(num_5,den_5);
figure(11)
rlocus(G5)
sgrid(0.707,10^4)
title('5. Root Locus')
fprintf('5. :\n')
fprintf('When zeta = 0.707, K = 3.17\n')
fprintf('------------------------------------\n')
%% 第六題
% CP7.4
num6=[1 -1]; den6=[1 4 5 4]; 
sys=tf(num6,den6); 
figure(12)
rlocus(sys)
title('6. Root Locus')
fprintf('6.:\n')
fprintf('The closed-loop system is stable for: 0 < P < 16/5 \n')

