% aere461 individual assignment
% by YunQi Bang
% compute excess power contours for flight at different alt & mach

clear,clc
% define constants
gamma=1.4; R=1716; densitySL=0.0023769;

% given characteristic
weighta=25000;
thrust=15000;
area=1100;
TSFC=0.6; % why do we need this

% flight condition
alt=linspace(0,35000,1000);
macha=linspace(0.1,0.8,1000);
g=[1 2 3]; % lift/weight -> lift=weight*g

% earth atmosphere model
% only for alt<36152ft
% find tempertature, pressure and density
T=59-0.00356.*alt; T=T+459.69;
pressure=2116.*(T./518.6).^5.256;
density=pressure./(1718.*T);

Ps=[];Pssmall=[];
for j=1:3 % loop for 3 different g
    weight=weighta*g(j);
    
    for i=1:1000 % loop for different mach
        mach=macha(i);
        
        % velocty from mach
        u=mach.*sqrt(gamma*R.*T);

        % dynamic pressure, q at different alt
        q=density.*(u.^2)/2;

        % thrust approx
        thrustcor=thrust.*density./densitySL;

        % find Cl to get aoa
        Cl=weight./(q.*area);
        aoa=(Cl-0.0894)./0.0763;

        % find Cd and drag
        Cd=(4.247e-4).*aoa.^2 + (3.637e-4).*aoa + (1.568e-2);
        drag=Cd.*q.*area;

        % excess power
        Ps(i,:) = u./weight .* ( thrustcor.*cosd(aoa) - drag ); % assume small aoa means this is unnecessary?
        Pssmall(i,:) = u ./ weight .* ( thrustcor - q.*Cd.*area ); % small aoa
        
    end
    
    % plot graphs
    figure(j)
    contourf(alt,macha,Pssmall,10); colorbar; colormap(jet)
    xlabel('Altitude (ft)'); ylabel('Mach number');
    title(['Excess Power Map g = ' num2str(j) '']);
end