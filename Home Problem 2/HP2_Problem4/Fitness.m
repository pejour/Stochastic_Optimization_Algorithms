function f = Fitness(functionData,dataResult)

    K = length(dataResult);
    error = 0;
    for i=1:K
        error = error + (functionData(i,2) - dataResult(i,2))^2;
    end
    error = sqrt((1/K)*error);
    f = 1/error;
end

