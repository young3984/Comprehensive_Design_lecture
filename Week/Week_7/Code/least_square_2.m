clear; clc; close all;

data=[-2.0 -1.5 -1.0 0 1.0 1.5 2.0
    -1.5 0 1.2 1.3 1.0 0.3 -2.0];

X=data(1,:); Y=data(2,:);

n=size(X',1);

sumx_4=0;
for ik=1:n
    sumx_4=sumx_4+X(ik)^4;      % for문을 사용해서 시그마를 구현
end   

sumx_3=0;
for ik=1:n
    sumx_3=sumx_3+X(ik)^3;      % for문을 사용해서 시그마를 구현
end   

sumx_2=0;
for ik=1:n
    sumx_2=sumx_2+X(ik)^2;      % for문을 사용해서 시그마를 구현
end   

sumx2y=0;
for ik=1:n
    sumx2y=sumx2y+X(ik)^2*Y(ik);      % for문을 사용해서 시그마를 구현
end   

sumxy=0;
for ik=1:n
    sumxy=sumxy+X(ik)*Y(ik);        % for문을 사용해서 시그마를 구현
end

sumy=0;
for ik=1:n
    sumy=sumy+Y(ik);                % for문을 사용해서 시그마를 구현
end   

sumx=0;
for ik=1:n
    sumx=sumx+X(ik);                % for문을 사용해서 시그마를 구현
end   
A=zeros(3,3); B=zeros(3,1);

A(1,1)=sumx_4; A(1,2)=sumx_3; A(1,3)=sumx_2;
A(2,1)=sumx_3; A(2,2)=sumx_2; A(2,3)=sumx;
A(3,1)=sumx_2; A(3,2)=sumx; A(3,3)=n;

B(1)=sumx2y; B(2)=sumxy; B(3)=sumy;

sol=A\B;

plot(X,Y,'o')       % 실제 데이터 그리기
hold on             % 지우지 말아라
x=-2:0.01:2;         % 벡터 생성
plot(x,sol(1)*x.^2+sol(2)*x+sol(3),'r')     % 구한 함수를 그려봄






