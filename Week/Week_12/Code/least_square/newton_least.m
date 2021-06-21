function a=newton_least(data)

x=data(1,:);        % split data
y=data(2,:);        % split data

a=1; error=0.0001;      % initial value & error


while 1
    sumf=0; sumfp=0;        % Initialization
    for ik=1:3
        sumf=sumf+exp(2*a*x(ik))*x(ik)-exp(a*x(ik))*x(ik)*y(ik);        % fx value
        sumfp=sumfp+2*exp(2*a*x(ik))*x(ik)^2-exp(a*x(ik))*x(ik)^2*y(ik);    % fx prime value
    end
    
    an=a-sumf/sumfp;       % newton method
    
    if abs(an-a)<error
        break       % check error
    end
    
    a=an;
    
end 

end