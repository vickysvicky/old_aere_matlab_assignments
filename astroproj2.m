clear, clc
 
%%%%%%%%%%%%%% given parameter values %%%%%%%%%%%%%%%%%
re=6378; rm=1738; rsoi=66200; D=384400; vm=1.018; u=1;
ue=3.986*10^5; wmoon=2.6491*10^-6; um=4.903*10^3;
TU=sqrt(1/ue*(re^3)); DU=re; 
 
 
% Calculation on approach to moon is calculated in earth canonical units
%%%%%%%%%%%%%% initial orbit %%%%%%%%%%%%%%%%%%%%%%%%%%
% altitude plus radius of earth to find initial radius
r0=(222+re)/re; 
 
i=1; vi=[]; hpi=[]; %define variables
% assume values of v0 and lambda1
lambda1=30
v0=1.3867329899998
 
while 1
Em0=(v0^2)/2-(u/r0)
Hm0=r0*v0;
 
%%%%%%%%%%%%%% transfer orbit %%%%%%%%%%%%%%%%%%%%%%%%%%
r1=sqrt( D^2 + rsoi^2 - 2*D*rsoi*cosd(lambda1) );
r1=r1/re
v1=sqrt( 2*(Em0 + u/r1) )
phi1=acosd(Hm0/(r1*v1))
phi1r=phi1/180*pi;
gamma1=asind( ((rsoi/re)/r1) * sind(lambda1) )
gamma1r=gamma1/180*pi;
 
%characteristics of transfer orbit
p1=Hm0^2/u;
atl=-u/(2*Em0)
etl=sqrt(1-(p1/atl))
 
E0=0; nu0=0  %at perigee
phi0=0
nu1=acosd((p1-r1)/(r1*etl))
nu1r=nu1/180*pi;


%find time of flight in transfer orbit
E1=acos((etl+cos(nu1r))/(1+etl*cos(nu1r)));
toftl=sqrt(((atl^3)/u))*((E1-etl*sin(E1))-(E0-etl*sin(E0)));
toftl=toftl*TU;



b01=wmoon*toftl;
b01=b01/pi*180
gamma0=nu1r-nu0-gamma1r-wmoon*toftl;
gamma0=gamma0/pi*180
v1=v1*(DU/TU);
 
% Calculation inside of Moon SOI is in SI units
%%%%%%%%%%%%%% inside Moon SOI %%%%%%%%%%%%%%%%%%%%%%%%%%
v2=sqrt( v1^2 + vm^2 - 2*v1*vm*cos(phi1r-gamma1r))
%characteristics of orbit
eps2=asind( ((vm/v2)*cosd(lambda1)-(v1/v2)*cosd(lambda1+gamma1-phi1)) )
Em2=v2^2/2-um/rsoi
phi2=eps2-90
Hm2=rsoi*v2*sind(eps2);
p2=Hm2^2/um;
a2=-um/(2*Em2)
e2=sqrt(1+(2*Em2*Hm2^2/um^2))
rp3=p2/(1+e2)
vp3=sqrt(2*(Em2+um/rp3))
nu2=acosh((p2-rp3)/rp3*e2)
hp=rp3-rm

%time of flight from SOI to periselenium and total time
toftl=toftl/3600
F1=2*atanh( sqrt((e2-1)/(1+e2)) *tand(nu2/2) )
tofm=sqrt(-(a2^3)/um) * (e2*sinh(F1)-F1);
tofm=tofm/3600
toft=toftl+tofm
 
if eps2>0 %runs code only if eps2 is negative to ensure retrograde encounter
    break
end
 
if hp<90.95 %find periselenium altitude lower than 90km
    vi(i)=v0; hpi(i)=hp;
    v0=v0+0.00000001; %small increment of v0
elseif hp>90
    break
end
 
if i>0 %only runs 10000 iterations
    break
end
i=i+1; %counter
 
end
 
plot(vi,hpi); title('v0 VS hp'); xlabel('v0 (DU/TU)'); ylabel('hp (km)');grid on
