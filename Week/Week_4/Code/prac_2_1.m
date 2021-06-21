% practice 2.1

clear; clc; close all;

x=[0 1 2];        % 초기값 설정
y=[1 3 2];     

syms xx             % 함수를 위한 변수 설정

l0(xx)=(xx-x(2))*(xx-x(3))/((x(1)-x(2))*(x(1)-x(3)));     % l0 구하기
l1(xx)=(xx-x(1))*(xx-x(3))/((x(2)-x(1))*(x(2)-x(3)));     % l1 구하기
l2(xx)=(xx-x(1))*(xx-x(2))/((x(3)-x(1))*(x(3)-x(2)));     % l2 구하기

p(xx)=l0(xx)*y(1)+l1(xx)*y(2)+l2(xx)*y(3);      % 보간 다항식
p(xx)=simplify(p(xx))       % 보간 다항식 정리 해주는 함수
