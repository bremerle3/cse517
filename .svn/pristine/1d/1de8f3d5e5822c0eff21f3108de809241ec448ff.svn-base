function [r,s]=hw0tests()
% function [r,s]=hw0tests()
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

WeakEps=sqrt(eps)*100;

% Test the inner-product function on a simple matrix
D=[1055    865    695    770    840
    865   1105    815    670    770
    695    815   1205    815    695
    770    670    815   1105    865
    840    770    695    865   1055];
try
	failtest=norm(innerproduct(magic(5))-D)>WeakEps;
 addon='';
catch
	failtest=true;
	addon=lasterr();
end;

if failtest,
    r=r+1;
	s{length(s)+1}=['Test 1 failed: Innerproduct function inaccurate. ' addon]
end;	

% A simple test to check for the output dimensions of innerproduct
x=rand(13,100); 		% define some random test points
z=rand(13,20); 		% define some random test points
try
 failtest=~all(size(innerproduct(x,z))==[100,20]);
 addon='';
catch
	failtest=true;
	addon=lasterr();
end;
if failtest,
	r=r+1;				% set output conditions and exit
	s{length(s)+1}=['Test 2 failed: Innerproduct output dimensions do not match input. '; addon]
end;

% A simple test to check for the output dimensions of innerproduct
x=rand(13,100); 		% define some random test points
try
 failtest=~all(size(l2distance(x))==[100,100])	;
 addon='';
catch
	failtest=true;
	addon=lasterr();
end;
if failtest,
	r=r+1;				% set output conditions and exit
	s{length(s)+1}=['Test 3 failed: Output of a l2distance(x) is not square. '; addon]
end;


% A simple test to check for the output dimensions of innerproduct
x=rand(13,100); 		% define some random test points
try
 d=l2distance(x);
 failtest=norm(d-d')>WeakEps,	;
 addon='';
catch
	failtest=true;
	addon=lasterr();
end;
if failtest,
	r=r+1;				% set output conditions and exit
	s{length(s)+1}=['Test 4 failed: Output matrix of l2distance(x) is not symmetric. '; addon]
end;



% A simple test is to look if the diagonal is all zero
x=rand(10,100); 		% define some random test points
try
 d=diag(l2distance(x));	
 failtest=~all(d<WeakEps);
 addon='';
catch
	failtest=true;
	addon=lasterr();
end;
if failtest,
	r=r+1;				% set output conditions and exit
	s{length(s)+1}=['Test 5 failed: Distance from a vector to itself is not zero. '; addon]
end;


% A simple test to check for the output dimensions
x=rand(13,100); 		% define some random test points
z=rand(13,20); 		% define some random test points
try
 d=l2distance(x,z);	
 failtest=~all(size(d)==[100,20]);
 addon='';
catch
	failtest=true;
	addon=lasterr();
end;
if failtest,
	r=r+1;				% set output conditions and exit
	s{length(s)+1}=['Test 6 failed: l2distance output dimensions do not match input. '; addon]
end;


% A simple test is to check if all distances are non-negative
x=rand(17,100); 		% define some random test points
z=rand(17,25); 		% define some random test points
try
 d=diag(l2distance(x,z));	 
 failtest=~all(d(:)>=0);
 addon='';
catch
	failtest=true;
	addon=lasterr();
end;
if failtest,
	r=r+1;				% set output conditions and exit
	s{length(s)+1}=['Test 7 failed: All distances must be >= 0.';  addon]
end;


x=[[1,0];[0,1]];
z=[[0,0];[1,1]];
try
 D=l2distance(x,z);
 D2=[[sqrt(2),sqrt(2)];[0,0]];
 failtest=max(max(abs(D2-D)))>WeakEps;
 addon='';
catch
	failtest=true;
	addon=lasterr();
end;
if failtest,
	r=r+1;				% set output conditions and exit
	s{length(s)+1}=['Test 8 failed: Distances between xor vectors are not correct. '; addon]
end;

z=[1   0   0   1
   0   1   0   1];
x=[0;0];
try
 D=l2distance(x,z);
 D2=[1,1,0,sqrt(2.0)];
 failtest=max(max(abs(D2-D)))>WeakEps;
 addon='';
catch
	failtest=true;
	addon=lasterr();
end;
if failtest,
    r=r+1;              % set output conditions and exit
    s{length(s)+1}=['Test 9 failed: Distances between unit vectors are not correct. '; addon]
end;


D=[ 0    78    24
    78     0    78
    24    78     0];
try
 failtest=norm(l2distance(magic(3)).^2-D)>WeakEps;
 addon='';
catch
	failtest=true;
	addon=lasterr();
end;
if failtest,
    r=r+1;
	s{length(s)+1}=['Test 10 failed: Distances inaccurate. ' addon]
end;	

x = [[1];[0]];
z = [[0];[1]];
try
 D = l2distance(x,z);
 D2 = sqrt(2);
 failtest=~(abs(D2-D)<WeakEps);
 addon='';
catch
	failtest=true;
	addon=lasterr();
end;
if failtest,
    r=r+1;
    s{length(s)+1}=['Test 11 failed: Distances between just 2 points is not correct. ' addon]
end;

x = rand(10,100);
try
 D = l2distance(x);
 failtest=norm(imag(D))>0.0;
 addon='';
catch
	failtest=true;
	addon=lasterr();
end;
if failtest,
    r=r+1;
    s{length(s)+1}=['Test 12 failed: Distances must be all real numbers (not imaginary).\nMake sure all values are non-zero before you take the squrae root.\n' addon]
end;

%%>>kqw