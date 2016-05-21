function bias=recoverBias(K,yTr,alphas,C);
% function bias=recoverBias(K,yTr,alphas,C);
%
% INPUT:	
% K : nxn kernel matrix
% yTr : nx1 input labels
% alphas  : nx1 vector or alpha values
% C : regularization constant
% 
% Output:
% bias : the hyperplane bias of the kernel SVM specified by alphas
%
% Solves for the hyperplane bias term, which is uniquely specified by the support vectors with alpha values
% 0<alpha<C
%


% YOUR CODE 
bool_idxs = (C > alphas)&(alphas > 0);
alpha_idxs = bool_idxs;
sorted = sort(alphas(alpha_idxs));
midpoint_idx = round(length(sorted)/2);
if (midpoint_idx == 0)
    midpoint_idx = 1;
end
if (length(sorted) >= 1)
    midpoint_alpha = sorted(midpoint_idx);
    unsorted_idx = find(alphas == midpoint_alpha);
else
    unsorted_idx = 1;
end
if(length(unsorted_idx > 1))
    unsorted_idx = unsorted_idx(1);
end
[m,n] = size(yTr');
if(m ~= size(alphas,1))
    yTr = yTr';
end
if(length(sorted) >= 1)
    bias = yTr(unsorted_idx) - sum(transpose(yTr).*K(:,unsorted_idx).*alphas);   %FIXME
else
    bias = yTr(unsorted_idx);
end
