function C=least_polynomial(data,m)

X=data(1,:); Y=data(2,:);

n=size(X',1);

A=ones(n,m+1); 

for ik=1:m
    for it=1:n
        A(it,ik)=X(it)^(m+1-ik);        
    end   
end    

C=(A'*A)\A'*Y';

end