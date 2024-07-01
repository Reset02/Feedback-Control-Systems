clc;
clear;
%% 第一題
%%part(a)
num1 = [1];den1=[1 10];
sys1=tf(num1,den1);
fprintf('Q1(a):\n')
sys_ss1 = ss(sys1)
%%part(b)
num2=[1 5 3];den2=[1 8 5];
sys2=tf(num2,den2);
fprintf('Q1(b):\n')
sys_ss2 = ss(sys2)
%%part(c)
num3=[1 1];den3=[1 3 3 1];
sys3=tf(num3,den3);
fprintf('Q1(c):\n')
sys_ss3 = ss(sys3)
%% 第二題
%%part(a)
A_1=[0 1;2 8];B_1=[0;1];C_1=[1 0];D_1=[0];
sys_ss_a=ss(A_1,B_1,C_1,D_1);
fprintf('Q2(a):\n')
sys_tf_a=tf(sys_ss_a)
%%part(b)
A_2=[1 1 0;-2 0 4;5 4 -7];B_2=[-1;0;1];C_2=[0 1 0];D_2=[0];
sys_ss_b=ss(A_2,B_2,C_2,D_2);
fprintf('Q2(b):\n')
sys_tf_b=tf(sys_ss_b)
%%part(c)
A_3=[0 1;-1 -2];B_3=[0;1];C_3=[-2 1];D_3=[0];
sys_ss_c=ss(A_3,B_3,C_3,D_3);
fprintf('Q2(c):\n')
sys_tf_c=tf(sys_ss_c)
%% 第三題
%%part(a)
a=[0 1 0;0 0 1;-3 -2 -5];b=[0;0;1];c=[1 0 0];d=[0];
sys_ss=ss(a,b,c,d);
fprintf('Q3(a):\n')
sys_tf=tf(sys_ss)
%%part(b)
x0=[0 -1 1];
t=[0:0.1:10];
u=0*t;
[y,t,x]=lsim(sys_ss,u,t,x0);
figure(1)
plot(t,x(:,1),t,x(:,2),':',t,x(:,3),'--');
xlabel('time(sec)'),ylabel('x(t)'),grid
title('Q2(b): x1-soild;x2-dotted,x3-dashed')
xf_sim=x(length(t),:)'
%%part(c)
fprintf('Q3(c):\n')
dt=10;
Phi=expm(a*dt); %%矩陣指數
xf_phi=Phi*x0'
%% 第四題
a_1=[0 1;-2 -3];b_1=[0;1];c_1=[1 0];d_1=[0];
sys_1=ss(a_1,b_1,c_1,d_1);
x4=[1;0];
t4=[0:0.1:10];
u4=0*t4;
[y4,t4,x_4]=lsim(sys_1,u4,t4,x4);
figure(2)
plot(t4,x_4(:,1),t4,x_4(:,2),'--')
xlabel('Time(sec)')
ylabel('State Respone')
title('Q4')
legend('x1,','x2')
grid
%% 第五題
syms s;
syms K;
a_2=[0 1 0;0  0 1;-2 -K -2];b_2=[0;0;1];c_2=[1 0 0];d_2=[0];
M=s*eye(3,3)-a_2;
detQ=det(M);
K=0:1:100;
for i=1:length(K)
    figure(3)
    plot(roots([1 2 K(i) 2]), 'o')
    hold on
end
plot([0,0],[-10,10], Color = 'black')
plot([-2.5,2.5],[0,0], Color = 'black')
hold off
title({['Q5']; ['when K>1 will make all the characteristic values lie in the left half-plane.']})
fprintf('Q5:\n')
fprintf('From the figures we can conclude that the range of K for which all values lie in the left half-plane is :\n')
fprintf('K > 1')
