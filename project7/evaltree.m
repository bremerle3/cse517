function [ypredict]=evaltree(T,xTe)
% function [ypredict]=evaltree(T,xTe);
%
% input:
% T0  | tree structure
% xTe | Test data (dxn matrix)
%
% output:
%
% ypredict : predictions of labels for xTe
%

%% fill in code here

n=size(xTe,2);
ypredict=zeros(1,n);
  for i=1:n
    ptr=1;
	while (true)        
		if (T(4,ptr)==0)
            ypredict(i)=T(1,ptr);
            break;
        end;
	 	if (xTe(T(2,ptr),i)<=T(3,ptr))           
            ptr=T(4,ptr);
        else
            ptr=T(5,ptr);
        end;
	end;
  end;