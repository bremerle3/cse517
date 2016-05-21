function D=l2distance(X,Z)
% function D=l2distance(X,Z)
%	
% Computes the Euclidean distance matrix. 
% Syntax:
% D=l2distance(X,Z)
% Input:
% X: dxn data matrix with n vectors (columns) of dimensionality d
% Z: dxm data matrix with m vectors (columns) of dimensionality d
%
% Output:
% Matrix D of size nxm 
% D(i,j) is the Euclidean distance of X(:,i) and Z(:,j)
%
% call with only one input:
% l2distance(X)=l2distance(X,X)
%

if (nargin==1) % case when there is only one input (X)
	%% fill in code here
    %Dij = sqrt(transpose(Xi-Zj)*(Xi-Zj))
    X_cross = repmat(diag(innerproduct(X)),[1,size(X,2)]);  
    Y_cross = repmat(transpose(diag(innerproduct(X))),[size(X,2),1]);
    D = X_cross+Y_cross-2*innerproduct(X,X);
    
    D = sqrt(D);
else  % case when there are two inputs (X,Z)
	%% fill in code here
    %Dij = sqrt(transpose(Xi-Zj)*(Xi-Zj))
    X_cross = repmat(diag(innerproduct(X)),[1,size(Z,2)]); %(nx1) column vector repeated m times for (nxm) matrix
    Y_cross = repmat(transpose(diag(innerproduct(Z))),[size(X,2),1]);  %transpose(mx1) row vector repeated n times for (nxm) matrix
    D = X_cross+Y_cross-2*innerproduct(X,Z);
    
    D = sqrt(D);
    
end;
%



