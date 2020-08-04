clear,clc
% AERE311 Homework4
% % Question 1
% % part a
% y=1.4; R=250; 
% m=0:0.01:4;
% fR=((1+(y-1)./2.*m.^2)./(1+y.*m.^2).^2).*m.^2;
% plot(m,fR); xlabel('M'); ylabel('fR(M)');
% 
% % part b
% %m1=0.5;
% %m1=2;
% m1=6;
% mdot=800; mdotf=8; T1=1000; h=4.4e7;
% cp=(y*R)/(y-1);
% f=mdotf/mdot;
% Tt1=T1*(1+(y-1)/2*m1^2);
% fRM1=((1+(y-1)/2*m1^2)/(1+y*m1^2)^2)*m1^2;
% Tt2=Tt1*(1+(f*h)/(cp*Tt1));
% f2=Tt2/Tt1*fRM1;
% a=(2*y*f2-1)^2; b=4*f2*(f2*y^2-(y-1)/2); c=2*f2*y^2+1-y;
% if m1<1
%     m2=sqrt((1-2*y*f2-sqrt(a-b))/c)
% elseif m1>1
%     m2=sqrt((1-2*y*f2+sqrt(a-b))/c)
% end
% clear a b c
% a=1+(y-1)/2*m2^2; b=1+(y-1)/2*m1^2;
% Pt2Pt1=((a/b)^(y/(y-1)))*(1+y*m1^2)/(1+y*m2^2)
% clear a b

% Question 2
% Part c
Ae=0.5:0.1:1000; Astar = 0.2; T0 = 2500; R= 287;
Pt= 6e6; gam = 1.4; mdot= 970.042; Patm= 22313;
for i=1:length(Ae)
ARatio=Ae(i)/Astar;
k1=218.0629-243.5764*gam+71.7925*gam^2;
k2=-0.122450+0.281300*gam;
Me(i)=(k1*ARatio+(1-k1)).^k2;
Te(i)=T0/(1+((gam-1)/2)*Me(i)^2);
Pe(i)=Pt/(T0/Te(i))^(gam/(gam-1));
Ue(i)=Me(i)*(gam*R*Te(i))^0.5;
F(i)=mdot*Ue(i)+(Pe(i)-Patm)*Ae(i);
end
Acrit=3.148;
location=find(round(Ae,1)==round(Acrit,1));
figure(1)
plot(Acrit,F(location),'ok')
legend('Maximum thrust')
hold on
plot(Ae,F,'k')
axis([0 10 1.6e6 2.2e6])
xlabel('Ae (m^2)');ylabel('F(N)');
figure(2)
plot(Acrit,Ue(location),'ok')
legend('Maximum thrust')
hold on
plot(Ae,Ue,'k')
axis([0 10 1600 2200])
xlabel('Ae (m^2)');ylabel('Ue (m/s)');
% Part d
h=0:50e3; k=1.5e-4;
Ae=linspace(0,10,length(h)); 
P0=100e3; Patm=P0*exp(-k*h);
for i=1:length(h)
ARatio=Ae(i)/Astar;
k1=218.0629-243.5764*gam+71.7925*gam^2;
k2=-0.12245+0.2813*gam;
Me(i)=(k1*ARatio+(1-k1)).^k2;
Te(i)=T0/(1+((gam-1)/2)*Me(i)^2);
Pe(i)=Pt/(T0/Te(i))^(gam/(gam-1));
Ue(i)=Me(i)*(gam*R*Te(i))^0.5;
F(i)=mdot*Ue(i)+(Pe(i)-Patm(i))*Ae(i);
end
figure(3)
plot(F,h); axis([1e6 2.5e6 0.5 50e3])
xlabel('F(N)');ylabel('h(m)');