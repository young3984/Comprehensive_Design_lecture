function [a,b,c,d]=spline_3(data)

x=data(1,:); y=data(2,:);   % data를 x값과 y값의 넣기
n=size(x',1)-1;     % data의 개수 보다 하나 작게 보간함수 생성

a=y; c=zeros(1,n+1); b=zeros(1,n); d=zeros(1,n);        % 초기값 설정해주기
h=zeros(1,n);       % h 초기값 설정해주기

for ik=1:n
    h(ik)=x(ik+1)-x(ik);        % h값 설정 
end    

%%% c 값 구하기 %%%

A=zeros(n-1);               % 선형 연립 방정식을 풀기 위한 A 행렬
u=zeros(1,n-1);             % 선형 연립 방정식을 풀기 위한 u 행렬

%%% A 행렬 설정하기 %%% 
A(1,1)=2*(h(1)+h(2)); A(1,2)=h(2);  
A(n-1,n-2)=h(n-2); A(n-1,n-1)=2*(h(n-2)+h(n-1));

for ik=2:n-2
    A(ik,ik-1)=h(ik);
    A(ik,ik)=2*(h(ik)+h(ik+1));
    A(ik,ik+1)=h(ik);
end

%%% U 행렬 설정하기 %%% 
for ik=1:n-1
    u(ik)=3*((y(ik+2)-y(ik+1))/h(ik+1)-(y(ik+1)-y(ik))/h(ik));    
end   

c(2:n)=A\u';        % c 값 구하기

%%% d 값 구하기 %%%
for ik=1:n
    d(ik)=(c(ik+1)-c(ik))/(3*h(ik));
end

%%% b 값 구하기 %%%
for ik=1:n
    b(ik)=(y(ik+1)-y(ik))/h(ik)-h(ik)*(c(ik+1)+2*c(ik))/3;
end   