function [loss,gradient]=ridge(w,xTr,yTr,lambda)
% function w=ridge(xTr,yTr,lambda)
%
% INPUT:
% w weight vector (default w=0)
% xTr dxn matrix (each column is an input vector)
% yTr 1xn matrix (each entry is a label)
% lambda regression constant
%
% OUTPUTS:
% loss = the total loss obtained with w on xTr and yTr
% gradient = the gradient at w
%
[d,n]=size(xTr);
loss = sum((transpose(w)*xTr - yTr).^2) + lambda*transpose(w)*w;
%Compute logistic loss gradient
gradient = 2*xTr*transpose(xTr)*w - 2*xTr*transpose(yTr) + 2*lambda*w;
