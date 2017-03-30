function [ w ] = ridgeR( x, y, lam ) 
    xTx = x'*x;  
    [m,n] = size(xTx);  
    temp = xTx + eye(m,n)*lam;  
    w = temp^(-1)*x'*y;  
end 