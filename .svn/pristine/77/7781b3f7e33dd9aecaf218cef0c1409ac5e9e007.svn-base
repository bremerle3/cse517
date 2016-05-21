clear all
close all;


%% load data
load digits

cl=[0,7];
ii=find(yTr==cl(1) | yTr==cl(2));
xTr=xTr(:,ii);
yTr=yTr(:,ii);
yTr=(yTr==cl(1)).*2-1;

bad=[];
figure(1);
set(gcf,'Position',[ 118   338   544   185]);
n=length(yTr);
colormap(gray);
%% do loop
w=xTr(:,1).*0;
err=1.0;
while err>0,
    ii=randperm(n);
    for i=1:n

         if sign(w'*xTr(:,ii(i)))~=yTr(ii(i)),

            %% draw offender
         subplot(1,2,2);
         imagesc(reshape(xTr(:,ii(i)),16,16));
         set(gca,'XTick',[],'YTick',[]);
         drawnow;
         %% do update
         w=w+yTr(ii(i)).*xTr(:,ii(i));
         xlabel([sprintf('Label: %i Pred:%2.2f',yTr(ii(i)),w'*xTr(:,ii(i)))]);
         title('Last Misclassification');
         
         %% compute new training error
         preds=sign(w'*xTr);
         err=sum(preds~=yTr)./length(yTr);        
        
         %% plot new vector
         subplot(1,2,1);
         imagesc(reshape(w,16,16));
         xlabel([sprintf('Error: %2.2f%%',err*100)]);
         set(gca,'XTick',[],'YTick',[]);
         title('Weight Vector');
         drawnow;
         bad=[bad ii(i)];
         input ('Press a key>');
        end;
        if err==0, break;end;
      end;      
end;
