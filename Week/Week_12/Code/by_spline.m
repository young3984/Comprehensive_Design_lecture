% 3차 스플라인 보간법으로 보간

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
% return;

% 단면 그리기 %

% for ik=1:2:n
%     figure
%     plot(X(ik,:),Y(ik,:));          
%     axis([-3 3 -3 3]);     
% end
% return

%%%%%% 복원 %%%%%%

tt = 0:h/2:2*pi; nn=size(tt',1);        % 가운데 값 하나 더 넣기
XX=zeros(nn,n); YY=XX; ZZ=XX;           % 근사한 값을 넣기 위한 XX와 YY

for ik=1:n
    
    coor=[X(:,ik)';Y(:,ik)'];           % X, Y 좌표값 넣기
    data=zeros(2,n);                    % 스플라인에 넣을 데이터 확인
    for it=1:n
        data(1,it)=t(it);               % x를 Z축으로 잡기
        data(2,it)=sqrt(coor(1,it)^2+coor(2,it)^2);     % z축과의 거리가 y가 된다
    end  
    
    [a,b,c,d]=spline_3(data);           % 스플라인으로 보간함수 만들기

    % 보간한 좌표를 평면에 맞취서 넣기
    for it=1:n-1
        x=t(it):h/2:t(it+1);            
        y=a(it)+b(it).*(x-t(it))+c(it).*(x-t(it)).^2+d(it).*((x)-t(it)).^3;
%         plot(x,a(it)+b(it).*(x-t(it))+c(it).*(x-t(it)).^2+d(it).*((x)-t(it)).^3)
%         hold on
        XX(2*it-1,ik)=y(1)*cos(the(ik)); YY(2*it-1,ik)=y(1)*sin(the(ik));
        XX(2*it,ik)=y(2)*cos(the(ik)); YY(2*it,ik)=y(2)*sin(the(ik));
        XX(2*it+1,ik)=y(3)*cos(the(ik)); YY(2*it+1,ik)=y(3)*sin(the(ik));
    end    

end

for ik=1:nn
    ZZ(ik,:)=tt(ik);    
end    

figure
mesh(XX,YY,ZZ)




