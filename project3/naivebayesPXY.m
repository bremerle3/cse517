function [posprob,negprob] = naivebayesPXY(x,y)
% function [posprob,negprob] = naivebayesPXY(x,y);
%
% Computation of P(X|Y)
% Input:
% x : n input vectors of d dimensions (dxn)
% y : n labels (-1 or +1) (1xn)
%
% Output:
% posprob: probability vector of p(x|y=1) (dx1)
% negprob: probability vector of p(x|y=-1) (dx1)
%

% add one all-ones positive and negative example
[d,n]=size(x);
x=[x ones(d,2)];
y=[y -1 1];

[d,n] = size(x);
%% fill in code here
[r1, c1] = find(y == 1);
posx = sum(x(:,c1),2);
posprob = posx/sum(posx);

[r2, c2] = find(y == -1);
negx = sum(x(:,c2),2);
negprob = negx/sum(negx);
