% 최소자승법으로 다항 보간

clear; clc; close all;

% 초기값 설정 %
h=pi/10;
t = 0:h:2*pi; n=size(t',1);     % t는 z의 범위, n은 단면의 개수  
the=t;                              % 나눌 평면의 개수
X=zeros(n); Y=X;  Z=X;              % 단면을 나타낼 X행렬과 Y행렬을 초기화

for ik=1:n  
    r=2+cos(t(ik));                 % 반지름 
    
    X(ik,:)=r*cos(the);             
    Y(ik,:)=r*sin(the);
    Z(ik,:)=t(ik);    
end

mesh(X,Y,Z)

%단면 그리기 %

% for ik=1:2:n
%     figure
%     plot(X(ik,:),Y(ik,:));          
%     axis([-3 3 -3 3]);     
% end

% 복원 %


x = 0:h/2:2*pi; nn=size(x',1);        % 가운데 값 하나 더 넣기
XX=zeros(nn,n); YY=XX; ZZ=XX;           % 근사한 값을 넣기 위한 XX와 YY
m=1;
y=zeros(1,nn);

for ik=1:n
    y=zeros(1,nn);
    coor=[X(:,ik)';Y(:,ik)'];           % X, Y 좌표값 넣기
    data=zeros(2,n);                    % 최소자승법에 넣을 데이터 확인
    for it=1:n
        data(1,it)=t(it);               % Z를 x로 잡기
        data(2,it)=sqrt(coor(1,it)^2+coor(2,it)^2);     % z축과의 거리가 y가 된다
    end 
    
    C=least_polynomial(data,m);           % 최소자승법으로 보간함수 만들기, 이 때 m이 우리 가원하는 고차다항식의 차수
     
    for iz=1:m+1    
        y=y+x.^(m+1-iz)*C(iz);          % 각 열에 최소자승법을 사용해 보간한 Z축과의 거리 
    end    
%     return
    XX(:,ik)=y*cos(the(ik));            % x 좌표 값 넣기
    YY(:,ik)=y*sin(the(ik));            % y 좌표 값 넣기
end

for ik=1:nn
    ZZ(ik,:)=x(ik);    
end  
figure
mesh(XX,YY,ZZ);
