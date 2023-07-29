function population = InitializePopulation(A, R, operatorSet, populationSize, numberOfGenes)

    population = zeros(populationSize,numberOfGenes);
    
    for k = 1:populationSize
        for i = 1:numberOfGenes
            if mod(i,4) == 1
                r = randi(length(operatorSet));
            elseif mod(i,4) == 2
                r = randi(length(R));
            else 
                r = randi(length(A));
            end
            population(k,i) = r;
        end
    end
end

