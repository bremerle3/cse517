function fun=kregression(xTr,yTr,sigma,lambda)
% function fun=kregression(xTr,yTr,sigma,lambda)
%
% Input:
% xTr | training data (2xn)
% yTr | training labels (1xn)
% sigma | kernel width (>0)
% lambda | regularization constant (>0)
%
% Output:
% fun | usage: predictions=fun(xTe);
%
%

kernel=@(x,z) (1+distance(x,z)./(2*sigma^2)).^(-4);
ridge=@(K,lambda) K+lambda.*eye(size(K));
beta=ridge(kernel(xTr,xTr),lambda)\yTr';
fun=@(Xt) beta'*kernel(xTr,Xt);

