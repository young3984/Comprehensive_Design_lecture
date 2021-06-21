% exercise 2.2

clear; clc; close all;

x=0.63;             % 근사할 값

x0=0.5; x1=0.6; x2=0.7; y0=1.648721; y1=1.822119; y2=2.013753;       % 초기 값 설정


p1=(x-x1)/(x0-x1)*y0+(x-x0)/(x1-x0)*y1;          % 보간 다항식 
p2=(x-x1)*(x-x2)/((x0-x1)*(x0-x2))*y0+(x-x0)*(x-x2)/((x1-x0)*(x1-x2))*y1+...
    (x-x0)*(x-x1)/((x2-x0)*(x2-x1))*y2;
error_1=abs(p1-exp(0.63))
error_2=abs(p2-exp(0.63))
    

