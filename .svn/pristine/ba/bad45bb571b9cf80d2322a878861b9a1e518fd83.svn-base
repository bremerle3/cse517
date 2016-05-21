function [r,s]=hw1tests()
% function [r,s]=hw1tests()
%
% Tests the functions from homework assignment 0
% Please make sure that the error statements are instructive. 
%
% Output: 
% r=0 number of tests that broke
% s= statement describing the failed test (s={} if all succeed)
%


% Put in any seed below
rand('seed',31415926535);
% initial outputs
r=0;
s={};

% Example:
% A simple test is to look if the diagonal is all zero
x=rand(10,100); 		% define some random test points
d=diag(l2distance(x));	% extract diagonal of distance matrix
if ~all(d<eps*100)			% if test failed ...
	r=r+1;				% set output conditions and exit
	s{length(s)+1}='Distance from a vector to itself is not zero.';
end;

x=[[1,0];[0,1]];
z=[[0,0];[1,1]];
D=l2distance(x,z);
D2=[[sqrt(2),sqrt(2)];[0,0]];
if ~(max(max(abs(D2-D)))<100*eps)
	r=r+1;				% set output conditions and exit
	s{length(s)+1}='Distances between XOR vectors--{(1,0),(0,0),(0,1),(1,1)} are not correct.';
end;


x=[[1,0,0,1];[0 1 0 1]];
y=[1 1 2 2];

if ~(all(knnclassifier(x,y,x,1)==y))
	r=r+1;				% set output conditions and exit
	s{length(s)+1}='Error with XOR vectors--{(1,0),(0,0),(0,1),(1,1)} and k=1. ';
end;

x=[[1,0,0,1];[0 1 0 1]];
y=[1 1 2 2];
if ~(all(knnclassifier(x,y,x,2)==y))
	r=r+1;				% set output conditions and exit
	s{length(s)+1}='Error with XOR vectors--{(1,0),(0,0),(0,1),(1,1)} and k=2. ';
end;

x = [-4,-3,-2,2,3,4];
y=[1,1,1,2,2,2];
x2 = [-1,1];
y2=[1,2];
if ~(all(knnclassifier(x,y,x2,2)==y2))
	r=r+1;				% set output conditions and exit
	s{length(s)+1}='Error with linear dataset--x={-4,-3,-2,2,3,4}, y={1,1,1,2,2,2} and k=2.';
end;

x = [-4,-3,-2,2,3,4];
y=[1,1,1,2,2,2];
x2 = [0,1];
y2=[1,2];
if ~(all(knnclassifier(x,y,x2,2)==y2))
	r=r+1;				% set output conditions and exit
	s{length(s)+1}='Error with linear dataset--x={-4,-3,-2,2,3,4}, y={1,1,1,2,2,2} and k=2.';
end;

%Testing (e) 
%Sometimes a k-NN classifier can result in a draw, when the majority vote is not clearly defined. 
%Can you improve your accuracy by falling back onto k-NN with lower k in such a case? (You should edit the file knnclassifier.m.)
x = [-4,-3,-2,1,2,4];
y=[1,1,1,2,2,2];
x2=[0];
y2=[2];
y3=[1];
if ~(all(knnclassifier(x,y,x2,4)==y2))
	r=r+1;				% set output conditions and exit
	s{length(s)+1}='Error with linear dataset--x={-4,-3,-2,1,3,4}, y={1,1,1,2,2,2} and k=4.';
end;
if ~(all(knnclassifier(x,y,x2,5)==y3))
	r=r+1;				% set output conditions and exit
	s{length(s)+1}='Error with linear dataset--x={-4,-3,-2,2,3,4}, y={1,1,1,2,2,2} and k=5.';
end;

x=[[1,0,0,1];[0 1 0 1]];
y=[1 1 2 2];
[inds,v]=findknn(x,x,1);
if ~(all(reshape(inds,1,length(y))==1:4))
	r=r+1;				% set output conditions and exit
	s{length(s)+1}='Error: The nearest neighbors for XOR dataset--{(1,0),(0,0),(0,1),(1,1)} are wrong. ';
end;

D=[ 0    78    24
    78     0    78
    24    78     0];
if norm(l2distance(magic(3)).^2-D)>eps*1000,
    r=r+1;
	s{length(s)+1}='Error: Distances inaccurate for magic(3).';
end;	


if analyze('acc',[1 2 3 4],[1 2 3 0])~=0.75,
    r=r+1;
	s{length(s)+1}='Error: Analyze function incorrect for zero-one loss.';
end;	

if analyze('abs',[0.5 1 3 4],[1 2 3 0])~=1.375,
    r=r+1;
	s{length(s)+1}='Error: Analyze function incorrect for absolute loss.';
end;	

if analyze('acc',knnclassifier(magic(4),[1,2,2,2],magic(4),1),([1,2,2,2]))~=1,
	r=r+1;
	s{length(s)+1}='Error: 1-nn classification error of a data set with itself should be zero';
end;

if analyze('abs',knnclassifier(magic(4),[1,2,1,2],magic(4),4),([1,2,1,2]))~=0,
	r=r+1;
	s{length(s)+1}='Error: 1-nn classification error of a data set with itself should be zero';
end;

x=rand(10,100);
y=round(rand(1,100));
preds=knnclassifier(x,y,x,1);
if analyze('acc',y,preds)~=1,
    r=r+1;
	s{length(s)+1}='The 1-NN error of a data set with itself should be 0 (but is not).'
end;	
