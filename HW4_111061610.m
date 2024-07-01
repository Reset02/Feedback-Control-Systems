clc;
clear;
%%
% 第一題
K=[10,200,500];
t = [0:0.01:7];
fprintf('CP4.3:\n')
for i=1:3
    num=5*K(i); den=[1 15 K(i)];
    sys_1 = tf(num,den);
    y1(:,i)= step(sys_1,t);
end
figure(1)
plot(t,y1(:,1),t,y1(:,2),'--',t,y1(:,3),':')
xlabel('Time (s)');
ylabel('y(t)');
title('CP4.3 Step responses for K=10, 200, and 500');
legend('K=10','K=200','K=500')
x_1=stepinfo(y1(:,1),t);
x_2=stepinfo(y1(:,2),t);
x_3=stepinfo(y1(:,3),t);
T=table([0;14.0069;32.6704],[5.1998;0.4087;0.4959],[-4;-4;-4],'VariableNames',{'Percent Overshoot',' 2% Settling Time (s)','Steady-State Error'},'RowName',{'10','200','500'});
disp(T)
%%
% 第二題
numcg = [10]; dencg = [1 2 0];
sys_o = tf(numcg,dencg);
fprintf('-----------------------------------------------\n')
fprintf('CP4.4\n')
fprintf('(a):\n')
sys_c1 = feedback(sys_o,[1])
fprintf('(b):\n')
num_2=[1]; den_2=[1 2 0];
sys_2=tf(num_2,den_2);
sys_c2 = feedback(sys_2,10)
t = [0:0.1:5];
%y_2_1=step(sys_c1,t);
%y_2_2=step(sys_c2,t);
%(a)
figure(2)
subplot(2,1,1)
y_2_1=step(sys_c1,t);
plot(t,y_2_1)
subtitle('Step responses');
%(b)
subplot(2,1,2)
y_2_2=step(sys_c2,t);
plot(t,y_2_2)
subtitle('Disturbance response')
%(c)
fprintf('(c):\n')
fprintf('The estimated steady-state tracking error due to a unit step input is: 0\n')
fprintf('The estimated steady-state tracking error to a unit disturbance is: 0.1\n')
%(d)
fprintf('(d):\n')
fprintf('The estimated maximum tracking error due to a unit step input is: 0.4\n')
fprintf('The estimated maximum tracking error to a unit disturbance is: 0.14\n')
fprintf('The maximum occurs at approximately t = 1s\n')
%%
% 第三題
n=35; d=[1 12 35];
t=[0:0.1:2.5];
ya=(35/2)*(exp(-5*t)-exp(-7*t));
sys_3 = tf(n,d);
y3=impulse(sys_3,t);
figure(3)
plot(t,y3,t,ya,'o')
xlabel('Time (sec)'), ylabel('y(t)'), 
legend('Computer','Analytic')
%%
% 第四題
numg=[10]; deng=[1 20 75 0]; 
sys_g = tf(numg,deng);
sys_4 = feedback(sys_g,1);
t=[0:0.1:100];
u=t; % Unit ramp input
figure(4)
lsim(sys_4,u,t);
fprintf('---------------------------------------------------\n')
fprintf('CP5.10:\n')
fprintf('e_ss=7.5')



