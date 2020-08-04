% clear, clc
% % AERE311 HW 3
% % Question 1 ---------------------------------------------------------
y=1.4; m1=1; 
% validation : m1=1; m2=1.435; p2p1=0.566;
theta1=asin(1/m1);
m2=1:0.01:3;
% find turning angle
c=-theta1-((sqrt((y+1)/(y-1)))*(atan((sqrt((y-1)/(y+1)))*(sqrt((m1^2)-1)))));
delta=c+asin(1./m2)+sqrt((y+1)/(y-1))*atan(sqrt((y-1)/(y+1))*sqrt(m2.^2-1));
 
% interpolating delta
d=10/180*pi;
for i=1:length(delta)-1
    if delta(i)<d && delta(i+1)>d
        deltai=delta(i);
        m2i=m2(i);
    end
end
 
% Newton's method
mnew=m2i;
for i=1:10000
    m=mnew;
    g=sqrt((y-1)/(y+1))*((asin(1/m))-deltai+c);
    fm=sqrt(m^2-1)+sqrt((y+1)/(y-1))*tan(g);
    dfm=(m-(sec(g))^2/m)/(sqrt(m^2-1));
    mnew=m-(fm/dfm);
    if abs(mnew-m)<(1^-5)
        break
    end
end
 
p2p1=((1+(((y-1)/2)*(m1^2)))^(y/(y-1)))./((1+(((y-1)/2).*(m2.^2))).^(y/(y-1)));
pnew=((1+(((y-1)/2)*(m1^2)))^(y/(y-1)))./((1+(((y-1)/2).*(mnew^2))).^(y/(y-1)));
pnew=real(pnew);
mnew
pnew
 
delta=delta./pi.*180;
deltai=deltai./pi.*180;
figure(1)
plot(delta,m2,delta,p2p1,'--',deltai,pnew,'ok',deltai,mnew,'ok')
title('M1=1')
xlabel('delta (deg)')
legend('M2','P2/P1','Inverse solution')
axis([0 40 0 3])
grid on
 
% M1=2 -----------------------------------------------------------------
y=1.4; m1=2; 
% validation : m1=1; m2=1.435; p2p1=0.566;
theta1=asin(1/m1);
m2=1:0.01:4;
% find turning angle
c=-theta1-((sqrt((y+1)/(y-1)))*(atan((sqrt((y-1)/(y+1)))*(sqrt((m1^2)-1)))));
delta=c+asin(1./m2)+sqrt((y+1)/(y-1))*atan(sqrt((y-1)/(y+1))*sqrt(m2.^2-1));
 
% interpolating delta
d=15/180*pi;
for i=1:length(delta)-1
    if delta(i)<d && delta(i+1)>d
        deltai=delta(i);
        m2i=m2(i);
    end
end
 
% Newton's method
mnew=m2i;
for i=1:10000
    m=mnew;
    g=sqrt((y-1)/(y+1))*((asin(1/m))-deltai+c);
    fm=sqrt(m^2-1)+sqrt((y+1)/(y-1))*tan(g);
    dfm=(m-(sec(g))^2/m)/(sqrt(m^2-1));
    mnew=m-(fm/dfm);
    if abs(mnew-m)<(1^-5)
        break
    end
end
 
p2p1=((1+(((y-1)/2)*(m1^2)))^(y/(y-1)))./((1+(((y-1)/2).*(m2.^2))).^(y/(y-1)));
pnew=((1+(((y-1)/2)*(m1^2)))^(y/(y-1)))./((1+(((y-1)/2).*(mnew^2))).^(y/(y-1)));
mnew
pnew
 
delta=delta./pi.*180;
deltai=deltai./pi.*180;
figure(2)
plot(delta,m2,delta,p2p1,'--',deltai,pnew,'ok',deltai,mnew,'ok')
title('M1=2')
xlabel('delta (deg)')
legend('M2','P2/P1','Inverse solution')
axis([0 40 0 4])
grid on
 
