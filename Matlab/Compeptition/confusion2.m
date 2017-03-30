function conmatrix=confusion2(data)
    set1=find(data(:,1)>0.5);
    TP1=find(data(set1,4)>0.5);
    TP1_2=find(data(set1,5)>0.5);
    TP1_3=find(data(set1,6)>0.5);
    
    
    set2=find(data(:,2)>0.5);
    TP2=find(data(set2,5)>0.5);
    TP2_1=find(data(set2,4)>0.5);
    TP2_3=find(data(set2,6)>0.5);
    
    set3=find(data(:,3)>0.5);
    TP3=find(data(set3,6)>0.5);
    TP3_1=find(data(set3,4)>0.5);
    TP3_2=find(data(set3,5)>0.5);
    
    
    conmatrix(1,1)=length(TP1);
    conmatrix(1,2)=length(TP1_2);
    conmatrix(1,3)=length(TP1_3);
    conmatrix(2,2)=length(TP2);
    conmatrix(2,1)=length(TP2_1);
    conmatrix(2,3)=length(TP2_3);
    conmatrix(3,3)=length(TP3);
    conmatrix(3,1)=length(TP3_1);
    conmatrix(3,2)=length(TP3_2);
end