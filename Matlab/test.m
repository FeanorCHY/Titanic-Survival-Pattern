newout=[];
% for i=1:418
%     if find(firstForest(:,1)==(i+891))
%         newout(i)=firstForest(find(firstForest(:,1)==(i+891)),2);
%     else
%         newout(i)=out(i);
%     end
%     
% end

for i=1:418
    if (Sex(i)==0)&&(out831(i)==1)&&(OUTLOG(i)==0)&&(OUTLOG2(i)==0)&&(OUTLOG3(i)==0)
        newout(i)=OUTLOG(i);
    else
        newout(i)=out831(i);
    end
end
newout=newout';