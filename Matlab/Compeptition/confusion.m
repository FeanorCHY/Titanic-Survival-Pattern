function conmatrix=confusion(data,cutoff)
	numberSet=unique(data(:,2));

    set1=find(data(:,1)>cutoff);
    FP=length(find(data(set1,2)==numberSet(1)));
    TP=length(find(data(set1,2)==numberSet(2)));
    
    set2=find(data(:,1)<cutoff);
    FN=length(find(data(set2,2)==numberSet(2)));
    TN=length(find(data(set2,2)==numberSet(1)));
    
    conmatrix(1,1)=TP;
    conmatrix(1,2)=FP;
    conmatrix(2,1)=FN;
    conmatrix(2,2)=TN;
end