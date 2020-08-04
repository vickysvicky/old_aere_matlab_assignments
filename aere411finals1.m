% AERE411 Final Exam
% Question 1
clear,clc

% define given parameters
h=4.4e7; gamma=1.4; R=287; Cp=1000; Tt4=1500;
M0=0.85; T0=223; A4a=0.04; A4b=0.05; A8=0.1; A8p=0.2;

% find pressure and temperature ratios
gammab=sqrt(gamma)*(2/(gamma+1))^((gamma+1)/(2*(gamma-1)));
tao_r=1+(gamma-1)/2*M0^2;
tao_lambda=Tt4/T0;


