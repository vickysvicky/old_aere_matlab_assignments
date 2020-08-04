clear, clc
% Aere331 Exam2
% Problem 1 ===============================================================
Cnb=.071 ; Cnr=-.125; Cndr=-.072;
rho=.002377; S=184; b=33.4; Iz=3530;
% Part a - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
u0=10:0.1:250;
a=1;
b=0.0044.*u0;
c=(1.47e-4).*(u0.^2);
d=(-1.49e-4).*(u0.^2);

root=[];
for i=1:length(u0)
    root(i,:)=(roots([a b(i) c(i)]))';
end

x=real(root(:,1)); yn=imag(root(:,1)); yp=-yn;
figure(1)
plot(x,yn,x,yp); xlabel('Real axis'); ylabel('Imaginary axis')
grid on
% Part d - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
% damping ratio = 0.707 (45deg)
% settling time = 2sec
% time constant = 0.5sec
p=roots([1 0.77 4.55]);
G=tf(-4.61, [1 0.77 4.55]);
Gc=-1*tf([1 1.0682],1);
GGc=G*Gc;
figure(2)
rlocus(GGc)
% Part e - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
Gc2=-0.71*tf([1 1],1);
GGci=G*Gc2;
Wi=feedback(GGci,1);
u0=50; Q=0.5*rho*u0^2;
Nr=Cnr*b*Q*S*b/(2*u0*Iz);
G2=tf(-4.61, [1 -Nr 4.55]);
GGcii=G2*Gc2;
Wii=feedback(GGcii,1);
figure(3)
step(GGci,'k')
hold on
step(GGcii,'--k')
legend('u0=176ft/s','u0=50ft/s')

% Question 2 ==============================================================
% Part a - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -
s=tf('s');
Gm=120/(s*(s+1));
Gant=tf(1000,[1 50 1000]);
Gp=Gm*Gant;
figure(4)
rlocus(Gp)
% Part b - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -
p=roots([1 51 1050 1000 0]);
Gc=tf([1 1.7653],1);
G=Gp*Gc;
figure(5)
rlocus(G)
% Part c - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -
G=G*0.0224;
W=feedback(G,1);
t=0:0.01:50; t=t'; u=t;
VW=lsim(W,u,t);
EVW=u-VW;
% Part d - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -
lag=tf([1 0.25],[1 0.0263]);
Glag=G*lag; 
Wlag=feedback(Glag,1);
figure(6)
step(W,'b');hold on
step(Wlag,'r');grid on
legend('without lag','with lag')
VWlag=lsim(Wlag,u,t);
EVWlag=u-VWlag;
figure(7)
plot(t,EVW,'b',t,EVWlag,'r')
legend('without lag','with lag')

% Question 3 ==============================================================
% Part a - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -
G=1/3*Gp;
figure(8)
bode(G)
margin(G)
grid on
% Part b - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -
Glead=tf([1/1.2004 1],[1/20.8266 1]);
Glag=tf([1/0.25 1],[1/0.0383 1]);
GG=G*Glead*Glag;
figure(9)
bode(GG)
margin(GG)
grid on
% Part c - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -
WW=feedback(GG,1);
figure(10)
step(W); hold on
step(Wlag,'*');
step(WW,'--'); grid on
legend('PD','PD+lag','lag/lead')
VWW=lsim(WW,u,t);
EVWW=u-VWW;
figure(11)
plot(t,EVW,t,EVWlag,'*',t,EVWW,'--k')
legend('PD','PD+lag','lag/lead')


