function preds=evalboost(BDT,xTe)
% function preds=evalboost(BDT,xTe);
%
% Evaluates a boosted decision tree on a test set xTe.
%
% input:
% BDT | Boosted Decision Trees
% xTe | matrix of m input vectors (matrix size dxm)
%
% output:
%
% preds | predictions of labels for xTe
%

%% fill in code here


[d,n]=size(BDT);
preds=zeros(1,size(xTe,2));
curr_alpha = 0;
for i=1:n
	tree=BDT{i}{1};
	alpha=BDT{i}{2};
	tree_val=evaltree(tree,xTe);
	preds = preds + alpha*tree_val;
	curr_alpha = curr_alpha + alpha;
end
preds = round(preds./curr_alpha);