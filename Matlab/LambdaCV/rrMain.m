function percentage = rrMain(trainX,trainY,testX,testY,lambda)
    [m,n] = size(trainX);
    labelNum = max(trainY);
    w0 = rands(n,labelNum);
    for i = 1:labelNum
        w0(:,i) = ridgeR(trainX,reformatMultiClass(trainY,i),lambda);
    end
%      percentage = w0;
    res = ridgeClassify(testX,w0);
    num = 0;
    [m,n] = size(testX);
    for i = 1:m
        if res(i,1)==testY(i,1)
            num = num+1;
        end
    end
    percentage = num/m;