clear;
clc ;
%%第1題
x = [ 2, 1+2*i ; -0.45, 5];
I = [ 1, 0 ; 0, 1];
z1 = 1/2*log(x+sqrt(1+x.^2))+I
%%第2題
A = [12,34,-4;34,7,87;3,65,7];
B = [1,4,7;2,5,8;3,6,9];
z2 = A*B
z3 = A.*B
z4 = A^3
z5 = A.^3
z6 = [A([1,3],:);B^2]
z7 = eig(B)
z8 = det(A)
%%第3題
Q = [1/2,1/3,1/4;1/3,1/4,1/5;1/4,1/5,1/6];
P = [0.95;0.67;0.52];
S = [0.95;0.67;0.53];

x_value_052 = Q\P
x_value_053 = Q\S
%%第4題
H = zeros(9,9);
for i=1:9
    for j=1:9
        if i==9 & j==9
         H(i,j)=[1/(i+j-1)]
        else
            H(i,j)=[1/(i+j-1)];
        end
    end
end
%%第5題
subplot(1,2,1)
fplot(@(x) -sqrt(cos(x))+3,[-pi/2 , pi/2])
title('-sqrt(cos(x))+3')
xlabel('x')

subplot(1,2,2)
syms x y
ezplot((x.^2/2^2)-(y.^2/4^2), [-2 ,2 , -4 , 4])

