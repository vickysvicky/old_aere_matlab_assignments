% clear,clc
% 
% xmaxc=0.2:0.1:0.8;
% zmaxc=[0.01 0.05 0.1];
% 
% al0=@()
% 
% for i=1:length(zmaxc)
%     A=zmaxc(i).*(xmaxc).^(-2);
%     B=2.*xmaxc;
%     D=1-2.*xmaxc;
%     E=zmaxc(i)./(1-(xmazc).^2);
%     
%     alpha1=integral(@(xmaxc,theta)(1-2*xmaxc)*(A*B+A*(cos(theta)-1)^2),0)
%     
% end
% 
clear,clc

%AerE 310 S16 Extra credit 2 code
%Shuhan Yang

%Zmax/c = 0.01
x = 0.2:0.1:0.8;
z = 0.01;
A = z*x.^(-2);
B = 2*x;
D = 1-2*x;
E = z*(1-x).^(-2);
T = acos(1-2*x);
a = [0,0,0,0,0,0,0];
for i = 1:7
   fun1 = @(t) A(i)*B(i)+A(i)*(cos(t)-1).^2;
   fun2 = @(t) B(i)*E(i)+E(i)*(cos(t)-1).^2;
   a(i) = -1/pi*integral(fun1,0,T(i))-1/pi*integral(fun2,T(i),pi);
end
cL1 = 2*pi*(-5*pi/180-a);
cL2 = 2*pi*(5*pi/180-a);
L1 = 1/2*0.0023769*58.6667^2*1*2/12*cL1;
L2 = 1/2*0.0023769*58.6667^2*1*2/12*cL2;
figure(1)
plot(x,a);
xlabel('xmax/c');
ylabel('alpha L=0');
title('zmax/c = 0.01');
figure(2)
plot(x,L1);
xlabel('xmax/c');
ylabel('lift force in lb');
title('zmax/c = 0.01,alpha = -5');
figure(3)
plot(x,L2);
xlabel('xmax/c');
ylabel('lift force in lb');
title('zmax/c = 0.01,alpha = 5');

%Zmax/c = 0.05
x = 0.2:0.1:0.8;
z = 0.05;
A = z*x.^(-2);
B = 2*x;
D = 1-2*x;
E = z*(1-x).^(-2);
T = acos(1-2*x);
a = [0,0,0,0,0,0,0];
for i = 1:7
   fun1 = @(t) A(i)*B(i)+A(i)*(cos(t)-1).^2;
   fun2 = @(t) B(i)*E(i)+E(i)*(cos(t)-1).^2;
   a(i) = -1/pi*integral(fun1,0,T(i))-1/pi*integral(fun2,T(i),pi);
end
cL1 = 2*pi*(-5*pi/180-a);
cL2 = 2*pi*(5*pi/180-a);
L1 = 1/2*0.0023769*58.6667^2*1*2/12*cL1;
L2 = 1/2*0.0023769*58.6667^2*1*2/12*cL2;
figure(4)
plot(x,a);
xlabel('xmax/c');
ylabel('alpha L=0');
title('zmax/c = 0.05');
figure(5)
plot(x,L1);
xlabel('xmax/c');
ylabel('lift force in lb');
title('zmax/c = 0.05,alpha = -5');
figure(6)
plot(x,L2);
xlabel('xmax/c');
ylabel('lift force in lb');
title('zmax/c = 0.05,alpha = 5');

%Zmax/c = 0.1
x = 0.2:0.1:0.8;
z = 0.1;
A = z*x.^(-2);
B = 2*x;
D = 1-2*x;
E = z*(1-x).^(-2);
T = acos(1-2*x);
a = [0,0,0,0,0,0,0];
for i = 1:7
   fun1 = @(t) A(i)*B(i)+A(i)*(cos(t)-1).^2;
   fun2 = @(t) B(i)*E(i)+E(i)*(cos(t)-1).^2;
   a(i) = -1/pi*integral(fun1,0,T(i))-1/pi*integral(fun2,T(i),pi);
end
cL1 = 2*pi*(-5*pi/180-a);
cL2 = 2*pi*(5*pi/180-a);
L1 = 1/2*0.0023769*58.6667^2*1*2/12*cL1;
L2 = 1/2*0.0023769*58.6667^2*1*2/12*cL2;
figure(7)
plot(x,a);
xlabel('xmax/c');
ylabel('alpha L=0');
title('zmax/c = 0.1');
figure(8)
plot(x,L1);
xlabel('xmax/c');
ylabel('lift force in lb');
title('zmax/c = 0.1,alpha = -5');
figure(9)
plot(x,L2);
xlabel('xmax/c');
ylabel('lift force in lb');
title('zmax/c = 0.1,alpha = 5');