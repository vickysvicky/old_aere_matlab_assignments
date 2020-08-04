% aere362hw4

%load previous converged numbers
aere362hw3 

% get new converged numbers with 5% increased in parameters
% find local sensitivities
% Fr from different inputs
m1=m*1.05;
Fr1=60*P/(pi*m1*z*npg)*tand(20);
senFm=(Fr1-Fr)/(m1-m)
z1=z*1.05;
Fr1=60*P/(pi*m*z1*npg)*tand(20);
senFz=(Fr1-Fr)/(z1-z)
npg1=npg*1.05;
Fr=60*P/(pi*m*z*npg1)*tand(20);
senFn=(Fr1-Fr)/(npg1-npg)

% wp from different inputs
wpf1=@(m,z) m*z; wpf2=@(dp,b,rho) dp^2*pi*b*2*rho/4;
dp1=wpf1(m1,z);
wp1=wpf2(dp1,b,rho);
senWm=(wp1-wp)/(m1-m)
dp1=wpf1(m,z1);
wp1=wpf2(dp1,b,rho);
senWz=(wp1-wp)/(z1-z)
b1=b*1.05;
dp1=wpf1(m,z);
wp1=wpf2(dp1,b1,rho);
senWb=(wp1-wp)/(b1-b)

% np from different inputs
Lp1=Lp*1.05;
Fp=9.81*wp+Fr;
wps1=pi/4*dps^2*Lp1*rho;
I=pi/64*dps^4;
fp1=Fp*Lp1^3/(48*E*I);
K1=Fp/fp1;
wn1=sqrt(K1/wps1);
np1=wn1/(sqrt(1/fp1+1))*60/(2*pi);
senNl=(np1-np)/(Lp1-Lp)

dps1=dps*1.05;
Fp=9.81*wp+Fr;
wps1=pi/4*dps1^2*Lp*rho;
I1=pi/64*dps1^4;
fp1=Fp*Lp^3/(48*E*I1);
K1=Fp/fp1;
wn1=sqrt(K1/wps1);
np1=wn1/(sqrt(1/fp1+1))*60/(2*pi);
senNd=(np1-np)/(dps1-dps)

Fr1=Fr*1.05;
Fp1=9.81*wp+Fr1;
wps=pi/4*dps^2*Lp*rho;
I=pi/64*dps^4;
fp1=Fp1*Lp^3/(48*E*I);
K1=Fp1/fp;
wn1=sqrt(K1/wps);
np1=wn1/(sqrt(1/fp1+1))*60/(2*pi);
senNf=(np1-np)/(Fr1-Fr)

wp1=wp*1.05;
Fp1=9.81*wp1+Fr;
wps=pi/4*dps^2*Lp*rho;
I=pi/64*dps^4;
fp1=Fp1*Lp^3/(48*E*I);
K1=Fp1/fp;
wn1=sqrt(K1/wps);
np1=wn1/(sqrt(1/fp1+1))*60/(2*pi);
senNw=(np1-np)/(wp1-wp)

% find total derivative
A=[1 0 -senFn; 0 1 0; -senNf -senNw 1];
B=[0 senFm senFz 0 0; senWb senWm senWz 0 0; 0 0 0 senNl senNd];
dydx=(inv(A))*B
