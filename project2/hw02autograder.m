function [percentage,score]=hw02autograder()
% function [percentage,score]=hw0autograder()
%
% Tests the functions from homework assignment 0
% Please make sure that the error statements are instructive. 
%
% Output: 
% r=0 number of tests that broke
% s= statement describing the failed test (s={} if all succeed)
%

% handle unit tests
[r,s]=hw02tests();
for i=1:length(s)
    disp(s{i});
end;


