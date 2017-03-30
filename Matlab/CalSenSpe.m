function senSpe=CalSenSpe(result,cutoff)
    TP=length(find(result(find(result(:,1)>cutoff),2)==1));
    FP=length(find(result(find(result(:,1)>cutoff),2)~=1));
    TN=length(find(result(find(result(:,1)<=cutoff),2)==0));
    FN=length(find(result(find(result(:,1)<=cutoff),2)~=0));
    senSpe.TPR=TP/(TP+FN);
    senSpe.FPR=FP/(TN+FP);
end