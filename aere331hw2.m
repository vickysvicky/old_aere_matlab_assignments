% Question 4
% calculate transfer function of system
Gp=tf(10,[1 0.2 100]);
Gc=tf([8.9241 190],1);
G=Gp*Gc;
% get closed loop transfer function
W=feedback(G,1);
% remove s from numerator
W1=tf(1900,[1 89.44 2000]);
% plot step response
figure(1)
step(W)
hold on
% overlay tf without s in numerator
step(W1,'-.')
legend('closed loop tf','closed loop tf without s in numerator')


% Question 5
% plot FRF magnitude for system in 4d
figure(2)
bode(W)
% declare input
t=0:0.001:0.2;
yr=sin(1000*t);
y=lsim(W,yr,t);
figure(3)
plot(t,yr,'-.')
hold on
plot(t,y,'LineWidth',2)

