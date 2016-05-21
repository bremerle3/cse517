%% split_data: Splits the data into training and testing data in a specified ratio
%% function [xTr,yTr,xTe,yTe] = split_data(x,y,r=0.8)
function [xTr,yTr,xTe,yTe] = split_data(x,y,r=0.8)
	total_size = size(x,2);
	train_size = floor(r*total_size);
	xTr = x(:,1:train_size);
	yTr = y(:,1:train_size);
	xTe = x(:,train_size+1:end);
	yTe = y(:,train_size+1:end);
