function preds=evalforest(F,xTe)
% function preds=evalforest(F,xTe);
%
% Evaluates a random forest on a test set xTe.
%
% input:
% F   | Forest of decision trees
% xTe | matrix of m input vectors (matrix size dxm)
%
% output:
%
% preds | predictions of labels for xTe
%

%% fill in code here

[d,n]=size(xTe);
[l,m]=size(F);

all_preds=zeros(m,n);
for j=1:m
	T=F{j};
	tree_pred=evaltree(T,xTe);
	all_preds(j,:)=tree_pred;
end
preds=mode(all_preds);