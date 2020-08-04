% aere362 hw3

% given parameters
ba=[0.035 0.05 0.025];
ma=[0.005 0.0035 0.007];
za=[20 50 40];
lpa=[0.3 0.5 1];
dpsa=[0.02 0.05 0.03];
P=10000; rho=7860; E=200e9;

i=0; % counter

%set different cases
%b=ba(1); m=ma(1); z=za(1); Lp=lpa(1); dps=dpsa(1);
%b=ba(2); m=ma(2); z=za(2); Lp=lpa(2); dps=dpsa(2);
b=ba(3); m=ma(3); z=za(3); Lp=lpa(3); dps=dpsa(3);

% initial guess
npg=500; np=0; npgg=0;

while abs(npgg-npg)>1e-6 % iteration condition
    i=i+1; % counter
    % given formula
    % gear
    Fr=60*P/(pi*m*z*npg)*tand(20)
    dp=m*z;
    wp=dp^2*pi*b*2*rho/4

    % shaft
    Fp=9.81*wp+Fr;
    wps=pi/4*dps^2*Lp*rho;
    I=pi/64*dps^4;
    fp=Fp*Lp^3/(48*E*I);
    K=Fp/fp;
    wn=sqrt(K/wps);
    np=wn/(sqrt(1/fp+1))*60/(2*pi)
    npgg=npg;
    npg=np;
end