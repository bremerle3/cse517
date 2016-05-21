function output=analyze(kind,truth,preds)
% function output=analyze(kind,truth,preds)
%
% Analyses the accuracy of a prediction
% Input:
% kind='acc' classification error
% kind='abs' absolute loss
% (other values of 'kind' will follow later)
%


switch kind
	case 'abs'
		% compute the absolute difference between truth and predictions
		output=sum(abs(truth-preds))/length(truth);

	case 'acc'
		  if isempty(truth) && isempty(preds), output=0;
		  else output=sum(truth==preds)/length(truth);end;
end;

