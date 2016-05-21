function ybar=computeybar(xTe)
% function [ybar]=ybar(xTe);
% 
% computes the expected label 'ybar' for a set of inputs x
% generated from two standard Normal distributions (one offset by OFFSET in
% both dimensions.)
%
% INPUT:
% xTe | a 2xn matrix of column input vectors
% 
% OUTPUT:
% ybar | a 1xn vector of the expected label ybare(x)


global OFFSET;

[~,n]=size(xTe);
%ybar=zeros(1,n);

% Feel free to use the following function to compute p(x|y)
normpdf=@(x,mu,sigma)   exp(-0.5 * ((x - mu)./sigma).^2) ./ (sqrt(2*pi) .* sigma);

% Standard normal parameters
mu_std = zeros(2,n);
sigma_std = ones(2,n);
mu_offset = OFFSET.*ones(2,n);

% Generate pdfs under both assumptions
x_y1_data = normpdf(xTe, mu_std, sigma_std);
x_y2_data = normpdf(xTe, mu_offset, sigma_std);

% For a particular x=[x1;x2], P(x|y=y1) = P(x1|y=y1)*P(x2|y=y1)
x_y1 = x_y1_data(1,:).*x_y1_data(2,:);
% Similarly, P(x|y=y2) = P(x1|y=y2)*P(x2|y=y2)
x_y2 = x_y2_data(1,:).*x_y2_data(2,:);
 
% Bayes: P(y1|x) = P(x|y1)*P(y1)/(P(x|y1)*P(y1) + P(x|y2)*P(y1))
p_y1 = (x_y1*0.5)./(x_y1*0.5 + x_y2 *0.5);
p_y2 = (x_y2*0.5)./(x_y1*0.5 + x_y2 *0.5);

% Labels are not the means
y1_label = 1;
y2_label = 2;
ybar = p_y1*y1_label + p_y2*y2_label;