function K = computeK(kernel_type, X, Z, param)
% function K = computeK(kernel_type, X, Z)
% computes a matrix K such that Kij=g(x,z);
% for three different function linear, rbf or polynomial.
%
% Input:
% kernel_type: either 'linear','polynomial','rbf'
% X: n input vectors of dimension d (dxn);
% Z: m input vectors of dimension d (dxn);
% param: kernel parameter (inverse kernel width gamma in case of RBF, degree in case of polynomial)
%
% OUTPUT:
% K : nxm kernel matrix
%
%

linear = 1;
polynomial = 2;
rbf = 3;

if nargin<2,
	Z=X;
end;

type = -1;
if (strcmp(kernel_type, 'linear'))
    type = linear;
elseif (strcmp(kernel_type, 'poly'))
    type = polynomial;
elseif (strcmp(kernel_type, 'rbf'))
    type = rbf;
end

switch type
    case linear
        K = transpose(X)*Z;
    case polynomial
        K = (transpose(X)*Z + 1).^param;
    case rbf
        K = exp(-param.* l2distance(X,Z).^2);
    otherwise
        disp('Error: unrecognized kernel_type!');
end


%%YOUR CODE HERE
