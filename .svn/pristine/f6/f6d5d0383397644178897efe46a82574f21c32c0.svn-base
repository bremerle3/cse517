function w=perceptron(x,y);
% function w=perceptron(x,y);
%
% Implementation of a Perceptron classifier
% Input:
% x : n input vectors of d dimensions (dxn)
% y : n labels (-1 or +1)
%
% Output:
% w : weight vector
%

[d,n]=size(x);
w=zeros(d,1);

%% fill in code here

maxIts = 100;
Its = 0;
while(1)
   m = 0;
   for idx = randperm(n)
       w = perceptronUpdate(x(:,idx), y(idx), w);
       m = m + 1;
   end
   Its = Its + 1;
   if(Its >= maxIts)
       break;
   elseif (m == 0)
       break;
   end
end
