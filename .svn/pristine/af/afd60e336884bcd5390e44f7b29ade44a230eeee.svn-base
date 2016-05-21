function [w,b]=naivebayesCL(x,y);
% function [w,b]=naivebayesCL(x,y);
%
% Implementation of a Naive Bayes classifier
% Input:
% x : n input vectors of d dimensions (dxn)
% y : n labels (-1 or +1)
%
% Output:
% w : weight vector
% b : bias (scalar)
%

[d,n]=size(x);
%% fill in code here
[posprob, negprob] = naivebayesPXY(x,y);
[pos,neg] = naivebayesPY(x,y);
%log(P(Y|X)) = log(P(Y)) + sum(x*log(P(X|Y)) = b + w'*x;
w = log(posprob./negprob);
b = log(pos./neg);


