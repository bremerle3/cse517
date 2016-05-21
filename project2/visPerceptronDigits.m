clear all
close all;


%% load data
load digits

cl=[0,7];
ii=find(yTr==cl(1) | yTr==cl(2));
ii=ii(randperm(length(ii)));
xTr=xTr(:,ii);
yTr=yTr(:,ii);
yTr=(yTr==cl(1)).*2-1;



figure(1);
set(gcf,'Position',[ 118   338   544   185]);
n=length(yTr);
colormap(gray);
%% do loop
w=xTr(:,1).*0;
err=1.0;
while err>0,
    for i=1:n
            %% draw offender
         subplot(1,2,2);
         imagesc(reshape(xTr(:,i),16,16));
         set(gca,'XTick',[],'YTick',[]);
         xlabel([sprintf('Label: %i Pred:%2.2f',yTr(i),w'*xTr(:,i))]);
         title('Current Sample');
         drawnow;

         if classifyLinear(xTr(:,i),w,0)~=yTr(i),
             %% do update
             w=perceptronUpdate(xTr(:,i),yTr(i),w);          
             %% compute new training error
             preds=classifyLinear(xTr,w,0);
             err=sum(preds~=yTr)./length(yTr);        
        
             %% plot new vector
             subplot(1,2,1);
             imagesc(reshape(w,16,16));
             xlabel([sprintf('Error: %2.2f%%',err*100)]);
             title('Weight Vector');
             set(gca,'XTick',[],'YTick',[]);
             drawnow;
             input ('Press a key>');
        end;
        if err==0, break;end;
      end;      
end;
