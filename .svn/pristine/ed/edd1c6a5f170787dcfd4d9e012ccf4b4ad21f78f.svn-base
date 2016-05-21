function [w]=grdescent(func,w0,stepsize,maxiter,tolerance)
% function [w]=grdescent(func,w0,stepsize,maxiter,tolerance)
%
% INPUT:
% func function to minimize
% w0 = initial weight vector 
% stepsize = initial gradient descent stepsize 
% tolerance = if norm(gradient)<tolerance, it quits
%
% OUTPUTS:
% 
% w = final weight vector
%

if nargin<5,tolerance=1e-02;end;

%initializations
w = w0;
loss_last = inf; %Ensure at least one pass

%Do gradient descent. When loss decreases, increase stepsize by factor of 
%1.01. When loss increases, decrease stepsize by factor of 0.5
for i = 1:maxiter
    %Compute loss and gradient
    [loss, gradient] = func(w);
    if(norm(gradient) < tolerance)
        break;
    end
    if(loss < loss_last) %loss decreased
        stepsize = stepsize*1.01;
        w = w - stepsize *gradient;
    else  %loss increased, don't update
        stepsize = stepsize*0.5;
    end
    %Update loss
    loss_last = loss;
end
