% AERE331 Homework 4
% Question 1 ------------------------------------------
% Part a
s=tf('s');
W=(0.2*s+0.01)/((s^2)+0.2*s+0.01);
figure(1)
step(W)
 
% Part b
t=0:0.001:100;
thetaa=exp(-t./10)./5 - (t.*exp(-t./10))./100;
theta=(t.*exp(-t./10))./10 - exp(-t./10) + 1;
theta1=(t.*exp(-t./10))./5;
theta2=1 - (t.*exp(-t./10))./10 - exp(-t./10);
Mp=max(theta);
figure(2)
plot(t,thetaa,t,theta,'*k',t,theta1,'-.k',t,theta2,':k')
xlabel('Time (seconds)')
ylabel('Amplitude')
grid on
legend('thetaa','theta','theta1','theta2')
 
% Part c
WW=0.01/(s^2+0.2*s+0.01)
figure(3)
bode(W)
hold on
bode(WW)
