function T=id3tree(xTr,yTr,maxdepth,weights)
% function T=id3tree(xTr,yTr,maxdepth,weights)
%
% The maximum tree depth is defined by "maxdepth" (maxdepth=2 means one split).
% Each example can be weighted with "weights".
%
% Builds an id3 tree
%
% Input:
% xTr | dxn input matrix with n column-vectors of dimensionality d
% yTr | 1xn input matrix
% maxdepth = maximum tree depth
% weights = 1xn vector where weights(i) is the weight of example i
%
% Output:
% T = decision tree
%

%% fill in code here




n=length(yTr);
 if (nargin<4) 
     weights=(1/n).*ones(1,n);
 end
 
 if (nargin<3)
     maxdepth=inf;
 end
 
 % Hopefully no trees bigger than this...
 q = 6*10;
 T=zeros(6,q);
 % Initialize tree root. Has no parent. 
 root{1}.idx_range=1:n;
 root{1}.depth=1;
 root{1}.id=1;
 root{1}.parent=0;
 pointer=1;

 
 while (~isempty(root))
     curr_node_idx=length(root);
     idx_range = root{curr_node_idx}.idx_range;
     x=xTr(:,idx_range);
     y=yTr(idx_range);
     w=weights(idx_range);
     parent = root{curr_node_idx}.parent;
     depth = root{curr_node_idx}.depth;
     id = root{curr_node_idx}.id;
     S=sparse(1:length(y),y,w);
     s=sum(S,1);
     [m1,m2]=max(s);
     T(1,id)=m2;
     T(6,id)=parent;     
     if ((depth==maxdepth) || (all(y==y(1))))        
         root(curr_node_idx)=[]; %leaf node
     else
         [feature,cut,~]=entropysplit(x,y,w);
         T(2,id)=feature;
         T(3,id)=cut;
         T(4,id)=pointer+1;
         T(5,id)=pointer+2;                  
         % L-child node
         root{curr_node_idx}.idx_range=idx_range(x(feature,:)<=cut); 
         root{curr_node_idx}.id=pointer+1;
         root{curr_node_idx}.depth=depth+1;
         root{curr_node_idx}.parent=id;         
         % R-child node
         root{curr_node_idx+1}.idx_range=idx_range(x(feature,:)>cut);
         root{curr_node_idx+1}.id=pointer+2;
         root{curr_node_idx+1}.depth=depth+1;
         root{curr_node_idx+1}.parent=id;            
         % increment pointer
         pointer=pointer+2;         
     end;     
 end;
 % Flatten into full array T
 T=T(:,1:pointer);

