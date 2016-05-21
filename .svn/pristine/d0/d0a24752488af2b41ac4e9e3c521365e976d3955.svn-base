function [poscond, negcond] = naivebayes(x,y,x1)
%function logratio = naivebayes(x,y,x1)
% function possi = naivebayes(x,y);
%
% Computation of log P(Y|X=x1) using Bayes Rule
% Input:
% x : n input vectors of d dimensions (dxn)
% y : n labels (-1 or +1)
% x1: input vector of d dimensions (dx1)
%
% Output:
% poscond: log conditional probability log P(Y = 1|X=x1)
% negcond: log conditional probability log P(Y = -1|X=x1)
%

[d,n] = size(x);
%% fill in code here
[posprob, negprob] = naivebayesPXY(x,y);
[pos,neg] = naivebayesPY(x,y);
%Naive assumption: P(X=x1|Y) = P(X=x1(i)|Y=1)*P(X=x1(i+1)|Y=1)...P(X=x1(n)|Y=1)
%P(Y=1|X=x1) = P(X=x1|Y=1)*P(Y=1) --> log(P(Y=1|X=x1)) = log(P(X=x1|Y=1))+log(P(Y=1))
poscond = sum(x1.*log(posprob)) + log(pos);
%P(Y=-1|X=x1) = P(X=x1|Y=-1)*P(Y=-1) --> log(P(Y=-1|X=x1)) = log(P(X=x1|Y=-1))+log(P(Y=-1))
negcond = sum(x1.*log(negprob)) + log(neg);
