function [percentage,s]=hw03tests()
% function [percentage,s]=hw03tests()
%
% Tests the functions from homework assignment 0
% Please make sure that the error statements are instructive. 
%
% Output: 
% percentage= The percentage of tests that passed
% s= statement describing the failed test (s={} if all succeed)
%


% Put in any seed below
rand('seed',31415926535);
% initial outputs
r=0;
ok=0;
s={};

% load in name data
[xTr,yTr]=genTrainFeatures();

% check if probabilities sum to 1
[pos,neg] = naivebayesPY(xTr,yTr);
if norm(pos+neg-1)>1e-08,
    r = r+1;
    s{length(s)+1}='Your probabilities of P(Y) do not sum to 1.'
else,
    ok=ok+1;
end;


% Test the Naive Bayes function on a simple matrix
y=[-1 1];
x=[0 1
   1 0];

[pos,neg] = naivebayesPY(x,y);
pos0 = 0.5;
neg = 0.5;
if (pos ~= pos0) or (neg ~= neg0),
    r = r+1;
    s{length(s)+1}='The calculation of P(Y) seems incorrect.'
else,
    ok=ok+1;
end;


[pospossi,negpossi] = naivebayesPXY(x,y);
pospossi0 = [0.66667;0.33333];
negpossi0 = [0.33333;0.66667];
if (norm(pospossi - pospossi0) > 1e-03) or (norm(negpossi - negpossi0) > 1e-03),
    r = r+1;
    s{length(s)+1}='The calculation of P(X|Y) seems incorrect.'
else,
    ok=ok+1;
end;



[pospossi,negpossi] = naivebayesPXY(xTr,yTr);
if (norm((pospossi+negpossi)-ones(length(pospossi),1)))<1e-08,
    r = r+1;
    s{length(s)+1}='It looks like you compute P(Y|X) instead of P(X|Y). In general P(x|1)+P(x|-1) should not(!!) sum to 1. '
else,
    ok=ok+1;
end;

if (max(max(pospossi),max(negpossi)))>1,
    r = r+1;
    s{length(s)+1}='Your P(X|Y) returns probabilities that are greater than 1.'
else,
    ok=ok+1;
end;


if (min(min(pospossi),min(negpossi)))<=0,
    r = r+1;
    s{length(s)+1}='Your P(X|Y) returns probabilities that are not positive.'
else,
    ok=ok+1;
end;


if (norm(sum(negpossi)-1)>1e-08),
    r = r+1;
    s{length(s)+1}='Your P(X|-1) must sum to 1 if you sum over all X.'
else,
    ok=ok+1;
end;

if (norm(sum(pospossi)-1)>1e-08),
    r = r+1;
    s{length(s)+1}='Your P(X|+1) must sum to 1 if you sum over all X.'
else,
    ok=ok+1;
end;






[poscond, negcond] = naivebayes(x,y,[1;1]);
poscond0 = -2.1972;
negcond0 = -2.1972;
if (norm(poscond - poscond0) > 1e-03) or (norm(negcond - negcond0) > 1e-03),
    r = r+1;
    s{length(s)+1}='The calculation of log P(Y|X) seems incorrect.'
else,
    ok=ok+1;
end;

w=naivebayesCL(x,y);
w0=[0.69315;-0.69315];
if norm(w-w0)>1e-03,
    r=r+1;
	s{length(s)+1}='Naive Bayes seems incorrect.'
else,
ok=ok+1;
end;	


% Compute training error
[w,b]=naivebayesCL(xTr,yTr);
preds=classifyLinear(xTr,w,b);
score=sum(preds(:)==yTr(:))./length(yTr);
fprintf('Naive Bayes training accuracy is %2.1f%%\n',score*100);
if score<=0.6,
    r=r+1;
    s{length(s)+1}='Naive Bayes Training accuracy <= 0.6 -- this seems like a bad classifier.'
else,
ok=ok+1;
end;    




percentage=ok/(r+ok)*100;