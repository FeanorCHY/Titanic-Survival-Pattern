function averagePercentage = crossValidation2(data,label,lambda)
    [M,N]=size(data);
    indices=crossvalind('Kfold',M,10);
    p = 0.0;
    for k=1:10
        test = (indices == k); 
        train = ~test;
        train_data=data(train,:);
        train_label=label(train,:);
        test_data=data(test,:);
        test_label=label(test,:);
        p = p + rrMain(train_data,train_label,test_data,test_label,lambda);
    end
    averagePercentage = p/10;