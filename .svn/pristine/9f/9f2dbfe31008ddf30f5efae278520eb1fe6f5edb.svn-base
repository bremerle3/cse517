function treeForest=forest(x,y,nt)
% function F=forest(x,y,nt)
%
% INPUT:
% x | input vectors dxn
% y | input labels 1xn
%
% OUTPUT:
% F | Forest
%

%% fill in code here

[d,n]=size(x);
treeForest=cell(1,nt);
replace = true;
for i=1:nt
	xTr=[];
	yTr=[];
    indices=randsample(n,n,replace);
	xTr = x(:,indices);
	yTr = y(:,indices);
	T=id3tree(xTr,yTr);
	treeForest{i}=T;
end