function [res] = ridgeClassify(test_data,w)
    [m,n] = size(test_data);
    res = rand(m,1);
    [~,labelNum] = size(w);
    classPercentage = test_data*w;
    for i = 1:m
        max = [classPercentage(i,1),1];
        for j = 1:labelNum
            temp = classPercentage(i,j);
            if temp>max(1,1)
                max(1,1) = temp;
                max(1,2) = j;
            end
        end
        res(i) = max(1,2);
    end
end
            