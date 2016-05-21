function preds=knnclassifier(xTr,yTr,xTe,k);
% function preds=knnclassifier(xTr,yTr,xTe,k);
%
% k-nn classifier 
%
% Input:
% xTr = dxn input matrix with n column-vectors of dimensionality d
% xTe = dxm input matrix with n column-vectors of dimensionality d
% k = number of nearest neighbors to be found
%
% Output:
%
% preds = predicted labels, ie preds(i) is the predicted label of xTe(:,i)
%


% output random result as default (you can erase this code)
[d,n]=size(xTe);
[d,ntr]=size(xTr);
if k>ntr,k=ntr;end;

%currently assigning random predictions
% un=unique(yTr);
% preds=un(ceil(rand(1,n)*length(un)));

%Use knn algorithm
[indices,dists] = findknn(xTr,xTe,k);

preds = zeros(1,n);

for ii = 1:n
    near = zeros(1,k);
    for jj = 1:k
        near(1,jj) = yTr(indices(jj,ii));
    end
    guesses = unique(near);
    votes = zeros(1,length(guesses));
    for idx = 1:length(guesses)
        votes(1,idx) = sum(guesses(1,idx) == near);
    end
    winner = find(votes == max(votes));
    % If there's no clear winner, use a lower k value
    temp = near;
    while(length(winner) > 1)
        temp = temp(1,1:end-1);
        guesses = unique(temp);
        votes = zeros(1,length(guesses));
        for idx = 1:length(guesses)
            votes(1,idx) = sum(guesses(1,idx) == temp);
        end
        winner = find(votes == max(votes));
    end
    preds(1,ii) = guesses(winner);
end

%% fill in code here

