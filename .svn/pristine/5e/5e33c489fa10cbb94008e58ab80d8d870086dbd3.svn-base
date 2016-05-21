function [loss,gradient,preds]=hinge(w,xTr,yTr,lambda)
% function w=ridge(xTr,yTr,lambda)
%
% INPUT:
% xTr dxn matrix (each column is an input vector)
% yTr 1xn matrix (each entry is a label)
% lambda regression constant
% w weight vector (default w=0)
%
% OUTPUTS:
%
% loss = the total loss obtained with w on xTr and yTr
% gradient = the gradient at w
%

%Code here
[d,n]=size(xTr);
loss = sum(max(1 - yTr.*(transpose(w)*xTr), 0)) + lambda*transpose(w)*w;
gradient = -sum(repmat((1 - yTr.*(transpose(w)*xTr) > 0),d,1).*(repmat(yTr,d,1).*xTr),2) + 2*lambda*w;
preds = sign(transpose(w)*xTr);