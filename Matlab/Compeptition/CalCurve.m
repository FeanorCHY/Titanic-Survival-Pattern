function CalCurve(result,bin)
    result=sortrows(result,1);
    block=ceil(size(result,1)/bin);
    cur=[];
    for i=0:1:(bin-1)
        if i~=(bin-1)
            thisBlock=result((i*block+1):(i+1)*block,:);
        else
            thisBlock=result((i*block+1):size(result,1),:);
        end
        tem=size(find(thisBlock(:,2)==1),1)/block;
        cur=[cur;[min(thisBlock(:,1)),tem]];
        cur=[cur;[max(thisBlock(:,1)),tem]];
    end
    plot(cur(:,1),cur(:,2))
end