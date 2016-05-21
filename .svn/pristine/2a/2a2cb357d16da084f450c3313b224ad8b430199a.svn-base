clear all;

rng('shuffle');
N=100;% number of input vectors
% Define the symbols and colors we'll use in the plots later
symbols = {'o','x'};
colors = [0.5 0.5 1; 1 0.5 0.5];
classvals = [-1 1];
% axis([-5 5 -5 5]); %<-- redundant?

% Initialize training data to empty; will get points from user
% Obtain points froom the user:
trainPoints=randn(N,2).*1.5;
w=rand(2,1);
trainLabels=sign(trainPoints*w);
i=randperm(N);
trainPoints=trainPoints(i,:);
trainLabels=trainLabels(i,:);

figure('Name','Linear Classifier Visualization');


% initialize with all-zero
w=zeros(2,1);
w=perceptron(trainPoints',trainLabels');
b=0;
%[w,b]=naivebayes(x,y);
% Generate the plot

 res=300;
 xrange = linspace(-5, 5,res);
 yrange = linspace(-5,5,res);
 [pixelX pixelY] = meshgrid(xrange, yrange);
 testPoints = [pixelX(:) pixelY(:) ones(length(pixelX(:)),1).*b];
 testLabels=testPoints*[w;b];

 Z = reshape(testLabels, [res res]);
 Z(1,1)=1;
 [c,hs]=contourf(pixelX, pixelY, sign(Z), 'LineWidth', 2);
 colormap(colors);
 hold on;
 for c = 1:2
	    idx = find(trainLabels==classvals(c));
	    hp=plot(trainPoints(idx,1), trainPoints(idx,2), symbols{c}, 'Color','black','LineWidth',2);
 end
 hq=quiver(0,0,w(1),w(2),'LineWidth',2,'Color','red','AutoScale','off','AutoScaleFactor',1);
 hq2=quiver(0,0,w(1),w(2),'LineWidth',2,'Color','blue','Visible','off','AutoScale','on','AutoScaleFactor',1);
 axis equal; grid on; set(gca,'XTick',-5:5,'YTick',-5:5);
 drawnow;
