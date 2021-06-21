clear; clc; close all;

data=[-2 -1 0 1 2
    5 -8 -1 2 3];       % data

x=data(1,:);        % split data
y=data(2,:);        % split data

g1_2=0; g2_2=0; g3_2=0; g1g2=0; g1g3=0; g2g3=0;
yg1=0; yg2=0; yg3=0;        % initialization

for ik=1:4
   g1_2=g1_2+x(ik)^4;
   g1g2=g1g2+x(ik)^2*sin(x(ik));
   g1g3=g1g3+x(ik)^2*exp(x(ik));
   g2_2=g2_2+(sin(x(ik)))^2;
   g2g3=g2g3+sin(x(ik))*exp(x(ik));
   g3_2=exp(x(ik)*2);
   
   yg1=yg1+y(ik)*x(ik)^2;
   yg2=yg2+y(ik)*sin(x(ik));
   yg3=yg3+y(ik)*exp(x(ik));
   
end             

A=[g1_2 g1g2 g1g3
    g1g2 g2_2 g2g3
    g1g3 g2g3 g3_2];    

B=[yg1;yg2;yg3];

v=A\B;

a=v(1); b=v(2); c=v(3);

t=-2:0.1:2;     % graph
plot(t,a*t.^2+b*sin(t)+c*exp(t),'LineWidth',1)
hold on
plot(data(1,:),data(2,:),'o')

