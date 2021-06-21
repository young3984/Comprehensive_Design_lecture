% 최소자승법 1차 다항식
clear; clc; close all;

data=[10 20 30 50 70 80 90 100
    20.3 25.1 31.7 37.4 50.6 54.3 62.0 70.2];  % 데이터

X=data(1,:); Y=data(2,:);       % 데이터 쪼개기

n=size(X',1);                   % n의 크기를 구하기

sumx=0;
for ik=1:n
    sumx=sumx+X(ik);            % for문을 사용해서 시그마를 구현
end

sumx_2=0;
for ik=1:n
    sumx_2=sumx_2+X(ik)^2;      % for문을 사용해서 시그마를 구현
end    

sumxy=0;
for ik=1:n
    sumxy=sumxy+X(ik)*Y(ik);        % for문을 사용해서 시그마를 구현
end

sumy=0;
for ik=1:n
    sumy=sumy+Y(ik);                % for문을 사용해서 시그마를 구현
end   

A=zeros(2); B=zeros(2,1);           % 행렬을 만들기 위해서 초기화

A(1,1)=sumx_2; A(1,2)=sumx; A(2,1)=sumx; A(2,2)=n;  % 정규 방정식
B(1)=sumxy; B(2)=sumy;                              % 정규 방정식

sol=A\B;            % 역행렬을 통해서 a, b구하기

plot(X,Y,'o')       % 실제 데이터 그리기
hold on             % 지우지 말아라
x=10:1:100;         % 벡터 생성
plot(x,sol(1)*x+sol(2),'r')     % 구한 함수를 그려봄

