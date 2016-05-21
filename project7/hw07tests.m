function [r,s,ok]=hw07tests()
% function [r,s,ok]=hw07tests()
% Tests the functions from this homework assignment


%
% Output:
% r=0 number of tests that broke
% s= statement describing the failed test (s={} if all succeed)
% ok = number of tests passes
%


% Put in any seed below
rand('seed',31415926535);
% initial outputs
r=0;
ok = 0;
s={};
WeakEps=sqrt(eps)*100;

%% testing id3tree on xor data
x=[  0     1     0     1
     1     0     0     1];
y =[  2     2     1     1];
failtest=false;
try
  Txid3t1 = id3tree(x,y);
  addon='';
catch
  failtest=true;
  addon=lasterr();
end;
if failtest
  r=r+1;				% error
  s{length(s)+1}=['The id3tree crashes.' addon];
else
  [nrow,ncol]=size(Txid3t1);
  if ncol~=7,
    r=r+1;				% error
    s{length(s)+1}='The id3tree returns an wrong tree, number of nodes is wrong.';
    failtest= true;
  end
  if nrow~=6 && ~failtest,
    r=r+1;				% error
    s{length(s)+1}='The id3tree returns an wrong tree, not an 6 row tree.';
    failtest= true;
  end
  [f1 c1]=entropysplit(x,y);
  if f1 ~= Txid3t1(2,1)&& ~failtest
    r=r+1;				% error
    s{length(s)+1}='The id3tree seems not using entropysplit, feature wrong.';
    failtest= true;
  end
  if c1 ~= Txid3t1(3,1)&& ~failtest,
    r=r+1;				% error
    s{length(s)+1}='The id3tree seems not using entropysplit, cutoff value wrong.';
    failtest= true;
  end
  err3cnt = 0;
  cntFather = zeros(1,ncol+1);
  for i=1:ncol
    c=Txid3t1(3,i);
    left = Txid3t1(4,i);
    right = Txid3t1(5,i);
    if(c<0 || c>1)&&(left>0||right>0),
      err3cnt = err3cnt+1;
    end
    cntFather(1,Txid3t1(6,i)+1)=cntFather(1,Txid3t1(6,i)+1)+1;
  end
  for i=1:length(Txid3t1)+1
    if cntFather(1,i)>2&& ~failtest
      r=r+1;
      s{length(s)+1}='The id3tree returns an wrong tree, More than 2 node shares the same father.';
      failtest= true;
      break
    end
  end
  if err3cnt>0&& ~failtest,
    r=r+1;
    s{length(s)+1}='The id3tree returns an wrong tree, split cutoff value not correct.';
    failtest= true;
  end
end
if ~ failtest
  ok=ok+1;
end

failtest=false;% re-initialize
try
  Txid3t2 = id3tree(x,y,2);
  addon='';
catch
	failtest=true;
  addon=lasterr();
end;
if failtest
  r=r+1;				% error
	s{length(s)+1}=['The id3tree crashes.' addon];
else
  [nrow,ncol]=size(Txid3t2);
  if ncol>3,
    r=r+1;				% error
    s{length(s)+1}='The id3tree did''nt stop at maxdepth.';
    failtest=true;
  end
end
if ~failtest
  ok = ok+1;
end
failtest=false;
xtest = [0 1 1;0 1 0];
ytest = [1 1 2];
try
  resy = evaltree(Txid3t1,xtest);
  addon='';
catch
	failtest=true;
  addon=lasterr();
end;
if failtest
  r=r+1;				% error
	s{length(s)+1}=['The evaltree crashes.' addon];
else
  err = sum(abs(ytest - resy));
  if err>WeakEps,
    r=r+1;				% error
    s{length(s)+1}='evaltree makes some error.';
    failtest = true;
  end
end
if ~failtest
  ok=ok+1;
end
failtest=false;

sizeforest = 10;
try
  F=forest(x,y,sizeforest);
  addon='';
catch
	failtest=true;
  addon=lasterr();
end;
if failtest
  r=r+1;				% error
	s{length(s)+1}=['The forest crashes.' addon];
else
  numtree = length(F);
  if numtree~=sizeforest
    r=r+1;				% error
    s{length(s)+1}='forest tree number is wrong.';
    failtest=true;
  end
end
if ~failtest
  ok=ok+1;
end
failtest=false;

x_and_or = [0 0 0 0 1 1 1 1;
            0 0 1 1 0 0 1 1;
            0 1 0 1 0 1 0 1]; % (a and b ) or c
y_and_or = [1 2 1 2 1 2 2 2];
y_c_test = [1 2 1 2 1 2 1 2]; % c
try
  Tao = id3tree(x_and_or,y_and_or);
  val_and_or = prunetree(Tao, x_and_or ,y_c_test);
  resy = evaltree(val_and_or, x_and_or);
  addon='';
catch
	failtest=true;
  addon=lasterr();
end;
if failtest
  r=r+1;				% error
	s{length(s)+1}=['The prunetree test part crashes.' addon];
else
  err = sum(abs(resy - y_c_test));
  if err>WeakEps
    r=r+1;				% error
    s{length(s)+1}='prunetree seems not working/or the evaltree is wrong.';
    failtest=true;
  end
end
if ~failtest
  ok=ok+1;
end
failtest=false;

try
  boostT=boosttree(x_and_or,y_and_or);
  resBoost = evalboost(boostT,x_and_or);
  addon='';
catch
	failtest=true;
  addon=lasterr();
end;
if failtest
  r=r+1;				% error
	s{length(s)+1}=['The boost test part crashes.' addon];
else
  errb = sum(abs(resBoost-y_and_or));
  if errb>WeakEps
    r=r+1;				% error
    s{length(s)+1}='boosttree/evalboost seems to be wrong.';
    failtest=true;
  end
end
if ~failtest
  ok=ok+1;
end
failtest=false;
try
  [accs,total,sepacc] = hw07tictoc();
  addon='';
catch
	failtest=true;
  addon=lasterr();
end;
if failtest
  r=r+4;				% error
	s{length(s)+1}=['The final 4 test parts crash.' addon];
else
  if sepacc(1,1)<0.8
    r=r+1;				% error
    s{length(s)+1}='id3tree''s training accuracy is too low, seems to be something seems wrong.';
  elseif sepacc(2,1)<0.6
    r=r+1;				% error
    s{length(s)+1}='id3tree''s test accuracy is too low, seems to be something seems wrong.';
  end
  if sepacc(1,2)<0.8
    r=r+1;				% error
    s{length(s)+1}='PRUNED tree''s training accuracy is too low, seems to be something seems wrong.';
  elseif sepacc(2,2)<0.6
    r=r+1;				% error
    s{length(s)+1}='PRUNED tree''s test accuracy is too low, seems to be something seems wrong.';
  end
  if sepacc(1,3)<0.8
    r=r+1;				% error
    s{length(s)+1}='Forest''s training accuracy is too low, seems to be something seems wrong.';
  elseif sepacc(2,3)<0.6
    r=r+1;				% error
    s{length(s)+1}='Forest''s test accuracy is too low, seems to be something seems wrong.';
  end
  if sepacc(1,4)<0.8
    r=r+1;				% error
    s{length(s)+1}='Boost''s training accuracy is too low, seems to be something seems wrong.';
  elseif sepacc(2,4)<0.6
    r=r+1;				% error
    s{length(s)+1}='Boost''s test accuracy is too low, seems to be something seems wrong.';
  end
end
if ~failtest
  ok=ok+4;
end
