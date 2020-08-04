% Question 8

% define M as range of number from 0.01 to 4
M=0.01:0.01:4;
% given equation and value
y=1.4;
A=(1./M).*((2/(y+1)).*(1+((y-1)/2).*(M.^2))).^((y+1)/(2*(y-1)));

% a random input value of A
a=1.55;

% define variables
x=[];
x(1)=1;

% iteration counter for Newton's method
for n=1:100000000
    fx=(1/x(n))*((2/(y+1))*(1+((y-1)/2)*(x(n)^2)))^((y+1)/(2*(y-1)))-a;
    fxd=(-(1/(x(n))^2)*((2/(y+1))*(1+((y-1)/2)*(x(n))^2))^((y+1)/(2*(y-1))))+(((y+1)/(2*(y-1)))*(1/x(n))*((2/(y+1))*(1+((y-1)/2)*(x(n))^2))^(((y+1)/(2*(y-1)))-1))*((2*(y-1))/(y+1))*x(n);
    x(n+1)=x(n)-(fx/fxd);
    if abs(x(n+1)-x(n))<(10^-5) % stops iterations when absolute error falls below 10^-5
        break
    end
end

x(end)

plot(M,A,x(end),a,'or')
xlabel('M')
ylabel('A')
legend('A vs M','Newtons method solution')
title('Question 8')
axis equal