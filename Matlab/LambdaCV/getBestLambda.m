function [bestLambda,sorted] = getBestLambda(data,label)
    Lambdas = [0.1,0.01,0.001,0.0001,0.00001,1,10,100,1000,10000];
    i = length(Lambdas);
    result = rand(i,2);
    for k = 1:i
        result(k,1) = Lambdas(1,k);
        result(k,2) = crossValidation2(data,label,Lambdas(1,k));
    end
    sorted = sortrows(result,-2);
    bestLambda = sorted(1,1);