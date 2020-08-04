% Aere331 Homework 3
% Question 3
Gp=tf(4.6,[1 0.76 4.55]);
figure(1)
rlocus(Gp)

%W=???
%figure(1)
%step(Gp)

%PROBLEM 2
%2(d):
s=tf('s')
L=(s+2)/(s*(s+1)*(s+5)*(s+10))
bode(L)

%===============================
%PROBLEM 3
%3(a):
Gp=tf(4.6, [1 0.76 4.55])
rlocus(Gp)
sgrid
