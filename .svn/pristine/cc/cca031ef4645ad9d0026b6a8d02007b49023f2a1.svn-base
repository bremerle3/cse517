function [percentage,s]=hw02tests()
% function [percentage,s]=hw02tests()
%
% Tests the functions from homework assignment 0
% Please make sure that the error statements are instructive. 
%
% Output: 
% percentage of tests that passed
% s= statement describing the failed test (s={} if all succeed)
%


% Put in any seed below
rand('seed',31415926535);
% initial outputs
r=0;
s={};
ok=0;


% Test the Perceptron Update function on a simple matrix
x = [0;1];
y = -1;
w = [1;1];
w1 = perceptronUpdate(x,y,w);
if length(w1 == [1;0]) <2,
    r=r+1;
    s{length(s)+1}='Perceptron Update seems incorrect.'
else
	ok=ok+1;
end;



% Test perceptron on a simple 10 dimensional data set
N=100;
d=10;
x=randn(d,N);
w=rand(d,1);
y=sign(w'*x);
w=perceptron(x,y);
preds=classifyLinear(x,w,0);
score=sum(preds(:)==y(:))./length(y);
if score<1,
    r=r+1;
    s{length(s)+1}='Perceptron did not converge on a linearly separable data set. .'
else
ok=ok+1;
end;    

% Test the Perceptron on a linearly separable data set (this must lead to a solution with 100% accuracy):
x=[  -0.70072  -2.23769  -1.28357  -3.27927  -1.98508  -1.40251  -3.35145  -1.37491  -3.44509  -0.99489   0.63155   2.41051  -0.19401   2.08617   2.20720   0.32384   1.44111   0.59591   2.96363   1.70080
     -1.15826  -1.42917  -3.52909  -1.47949  -0.65195  -1.27096  -0.50274  -3.74950  -2.82399  -1.90591   1.83584   1.13768   0.62158   4.41117   1.24066   3.39487   1.48273   0.87830   3.00412   1.80916];
y=[   1   1   1   1   1   1   1   1   1   1  -1  -1  -1  -1  -1  -1  -1  -1  -1  -1];
w=perceptron(x,y);
preds=classifyLinear(x,w,0);
score=sum(preds(:)==y(:))./length(y);
if score<1,
    r=r+1;
    s{length(s)+1}='Perceptron cannot learn linearly separable data set - must be a bug.'
else
ok=ok+1;
end;    

percentage=ok/(ok+r).*100;
