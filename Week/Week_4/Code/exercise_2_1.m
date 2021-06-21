% exercise 2.1

clear; clc; close all;

x=0.63;             % 근사할 값

x0=0.6; x1=0.7; y0=1.822119; y1=2.013753;       % 초기 값 설정

p=(x-x1)/(x0-x1)*y0+(x-x0)/(x1-x0)*y1;          % 보간 다항식 

ap=p;                                           
real=exp(0.63);     % 실제 데이터
error=abs(ap-real)  %에러

