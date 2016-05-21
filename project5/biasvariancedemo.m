function [lbias,lvariance,lnoise,ltotal]=biasvariancedemo(makeplot)
% function [bias,variance,noise]=biasvariancedemo(makeplot)
% 
% This function generates a 2d data set from two Gaussian distributions
% and trains kernel regression functions with varying regularization constants
% The "total" error is decomposed into "bias", "variance", "noise".
%
% INPUT:
% makeplot | default=true (allows you to switch off the plotting)
%

%% define global variables
if nargin<1, makeplot=true;end;
global Nsmall Nbig NMODELS OFFSET;
Nsmall=10; % how big is the training set size N
Nbig=10000; % how big is a really big data set (approx. infinity)
NMODELS=100; % how many models do you want to average over
OFFSET=2;   % offset between the two Gaussians
LAMBDAS=[-6:0.5:0]; % What regularization constants to evaluate
%LAMBDAS=[0:0.25:7];
SIGMA=4; % what is the kernel width?


if makeplot,
 %% Visualize data
 close all;
 clf;
 [xTr,yTr]=toydata(OFFSET,1000);
 scat(xTr,2,yTr,'circles',0);
 colorbar;
 title('Data set from two Gaussians');
 disp('Please press a key ...');
 pause;
 clf;
end;


%% Different regularization constant classifiers
for md=1:length(LAMBDAS)
    lambda=2^LAMBDAS(md);
    % use this data set as an approximation of the true test set
    [xTe,yTe]=toydata(OFFSET,Nbig);

    
    %% Estimate AVERAGE ERROR (TOTAL)
    total=0;
    for j=1:NMODELS
        [xTr2,yTr2]=toydata(OFFSET,Nsmall);        
        fsmall=kregression(xTr2,yTr2,SIGMA,lambda);
        total=total+mean((fsmall(xTe)-yTe).^2);
    end;
    total=mean(total)/NMODELS;

    
    %% Estimate Noise
    ybar=computeybar(xTe);
    noise=mean((yTe-ybar).^2);
    
    %% Estimating BIAS
    hbar=computehbar(xTe,SIGMA,lambda);
    bias=mean((hbar-ybar).^2);
    
    
    %% Estimating VARIANCE
    variance=computevariance(xTe,SIGMA,lambda,hbar);
    
    
    
    %% print and store results
    lbias(md)=bias;
    lvariance(md)=variance;
    ltotal(md)=total;
    lnoise(md)=noise;
    lsum(md)=lbias(md)+lvariance(md)+lnoise(md);
    fprintf('Regularization lambda=2^%2.1f: Bias: %2.4f Variance: %2.4f Noise: %2.4f Total: %2.4f\n',LAMBDAS(md),lbias(md),lvariance(md),lnoise(md),ltotal(md));
    
    %% plot results
    if makeplot && md>2
     figure(1);
     hold on;
     plot(1:md,lbias,'r-','LineWidth',2);
     plot(1:md,lvariance,'k-','LineWidth',2);
     plot(1:md,lnoise,'g-','LineWidth',2);
     plot(1:md,ltotal,'b-','LineWidth',2);
     plot(1:md,lsum,'k--','LineWidth',2);
     legend('Bias','Variance','Noise','Test error','Bias+Var+Noise');
     xlabel('Regularization \lambda=2^x');
     ylabel('Squared Error');
     set(gca,'XTick',1:md);
     set(gca,'XTickLabel',LAMBDAS(1:md));
     set(gca,'FontSize',18);
     drawnow;
    end;
end;

