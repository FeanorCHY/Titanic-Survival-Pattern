function Roc(result)
    cur=[];
    interval=0.01;
    for i=min(result(:,1)):interval:max(result(:,1))
        senSpe=CalSenSpe(result,i);
        cur=[cur;[senSpe.FPR,senSpe.TPR]];
    end
    plot(cur(:,1),cur(:,2));
    area=sum(interval.*cur(:,2))
end