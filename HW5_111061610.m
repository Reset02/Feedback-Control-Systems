clear;
clc;
%%
%第一題
K=[0:0.1:5];
n=length(K);
for i=1:n
 numg=[1]; deng=[1 5 K(i)-3 K(i)];
 sys_o = tf(numg,deng);
 sys_cl = feedback(sys_o,[1]);
 p(:,i)= pole(sys_cl);
end
figure(1)
plot(real(p),imag(p),'x'), grid
title('CP6.6')
text(-0.9,0.95,'K=4 -->'); text(-0.2,1.3,'K=5'); text(0,0.2,'K=0')
% From a Routh-Hurwitz analysis we find that
% minimum K for stability is K=4
fprintf('CP6.6\n')
fprintf('Utilizing the Routh-Hurwitz approach, for stability we determine that:\n')
fprintf('K > 4\n')
Kmax=4;
numg=[1]; deng=[1 5 Kmax-3 Kmax]; sysg = tf(numg,deng);
sys_cl = feedback(sysg,[1]);
fprintf('When K= 4, the roots of the characteristic equation are:\n')
pole(sys_cl)
fprintf('--------------------------------------------------------------\n')
%%
%第二題
A=[0 1 0;0 0 1;-5 -12 -8]; b=[0;0;1];c=[1 1 0]; d=[0];
sys = ss(A,b,c,d);
fprintf('CP6.7\n')
% Part (a)
fprintf('(a)The characteristic equation is:\n')
p=poly(A)
% Part (b)
fprintf('(b)The roots of the characteristic equation are:\n')
roots(p)
fprintf('The system is stable since all roots of the characteristic equation are in the left half-plane\n')
fprintf('-----------------------------------------------------------------------------------------------------')
% Part (c)
t=[0:0.1:7];
figure(2)
y=step(sys,t);
plot(t,y)
title('(CP6.7)Step responses')
xlabel('Time(s)')
ylabel('Amplitude')
%%
%第三題
numc3=[21]; denc3=[1 0]; 
sysc3 = tf(numc3,denc3);
numg3=[1]; deng3=[1 2]; 
sysg3 = tf(numg3,deng3);
sys_o3 = series(sysc3,sysg3);
sys_3 = feedback(sys_o3,[1]);
t3=[0:0.01:6];
y3=step(sys_3,t3);
figure(3)
plot(t3,y3)
title('(CP5.4)Step responses')
xlabel('Time(s)')
ylabel('Amplitude')
fprintf('CP5.4\n')
fprintf('(a):\n')
T_s = feedback(sys_o3,[1])
wn=sqrt(21)
damping_ratio = 1/wn
P_O = 100*exp((-damping_ratio*pi)/(sqrt(1-damping_ratio^2)))
fprintf('算出來的P.O = 49.5355 percent \n')
fprintf('(b)\n')
x_1 = stepinfo(sys_3)
fprintf('可以看到P.O與(a)算出來的差不多都是49.5百分比左右')