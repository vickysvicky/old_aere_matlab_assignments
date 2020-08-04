% AERE411 Final Exam
% Question 2
clear,clc
close all

% define given parameters
N=18; ns=0.9; pi_cj=1.21; T0=215; gamma_c=1.4; Cpc=1000;
gamma_t=1.3; Cpt=1240; pi_d=0.97; pi_b=0.98; pi_n=0.99; nb=0.99; nm=0.99;
h=4.5e7; et=0.89; tao_lambda=7; M0=0.5:0.001:3.5;

% find specific thrust
pi_c=pi_cj^N;
tao_c=(1+ (1/ns) * (pi_c^((gamma_c-1)/(gamma_c*N))-1) )^N;
Rc=(gamma_c-1)/gamma_c*Cpc;
a0=sqrt(gamma_c*Rc*T0);

Fmdot=[]; S=[]; % define variables
for i=1:length(M0)
    M0i=M0(i);
    tao_r= 1 + (gamma_c-1)/2 * (M0i^2);
    pi_r=tao_r^(gamma_c/(gamma_c-1));
    f=(tao_lambda - tao_r*tao_c)/( (h*nb/(Cpc*T0)) - tao_lambda);
    tao_t= 1 - (1/(nm*(1+f))*tao_r/tao_lambda*(tao_c-1));
    pi_t=tao_t^(gamma_t/( (gamma_t-1) *et));
    pt9p9= pi_r * pi_d * pi_c * pi_b * pi_t * pi_n;
    t9t0=((Cpc/Cpt)*tao_lambda*tao_t)/(pt9p9^((gamma_t-1)/gamma_t));
    M0u9u0=sqrt(2/(gamma_c-1) * tao_lambda * tao_t * ( 1 - pt9p9^(-(gamma_t-1)/gamma_t)));
    Fmdoti= a0 * ( (1+f) * M0u9u0 - M0i + (1+f)*t9t0/(gamma_c*M0u9u0)*0 );
    Si=f*10^6/Fmdoti;
    Fmdot(i)=Fmdoti; S(i)=real(Si);
end

% plot results
figure(1)
plot(M0,Fmdot); title('Specific Thrust VS Inlet Mach Number');
ylabel('F/mdot (Ns/kg)'); xlabel('M_0'); grid on
figure(2)
plot(M0,S); title('Specific Fuel Consumption VS Inlet Mach Number');
ylabel('S (Ns/kg)'); xlabel('M_0'); grid on
xlim([0.5 2.2])
ylim([0 200])