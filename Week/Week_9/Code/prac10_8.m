clear; clc; close all;

data=[-1 0 1
    0.5 1 3];       % data

x=data(1,:);        % split data
y=data(2,:);        % split data

a=1; b=1; error=0.0001;      % initial value & error

while 1
    fa=0; fb=0; ga=0; gb=0; f=0; g=0;       % Initialization
    
    for ik=1:3
       fa=fa+2*b^2*exp(2*a*x(ik))*x(ik)^2-b*exp(a*x(ik))*x(ik)^2*y(ik);
       fb=fb+2*b*exp(2*a*x(ik))*x(ik)-exp(a*x(ik))*x(ik)*y(ik);
       ga=ga+2*b*exp(2*a*x(ik))*x(ik)-exp(a*x(ik))*x(ik)*y(ik);
       gb=gb+exp(2*a*x(ik));
       f=f+b^2*exp(2*a*x(ik))*x(ik)-b*exp(a*x(ik))*x(ik)*y(ik);
       g=g+b*exp(2*a*x(ik))-exp(a*x(ik))*y(ik);
    end    
    
    jac=[fa fb;ga gb];      % jacobian matrix
    
    abn=[a;b]-jac\[f;g];        % newton method
    
    if abs(abn(1)-a)<error && abs(abn(2)-b)<error        % check error
        break
    end
    
    a=abn(1);
    b=abn(2);

end 

t=-1:0.1:3;     % graph
plot(t,b*exp(a*t),'LineWidth',1)
hold on
w=1.0924;
plot(t,exp(w*t),'LineWidth',1)
hold on
plot(data(1,:),data(2,:),'o')

legend('b*e^ax','e^ax','실제값')