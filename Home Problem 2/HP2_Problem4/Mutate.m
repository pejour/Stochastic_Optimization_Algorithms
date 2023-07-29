function mutatedIndividual = Mutate(individual, mutationProbability, R, A)

    mutatedIndividual = individual;
    for i=1:length(individual)
        randomNumber = rand;
        if randomNumber < mutationProbability
            if mod(i,4) == 1
                range = 1:4;
                range([individual(i)]) = [];
                mutatedIndividual(i) = range(randi([1,3]));
            elseif mod(i,4) == 2
                range = 1:length(R);
                range([individual(i)]) = [];
                mutatedIndividual(i) = range(randi([1,length(R)-1]));
            else
                range = 1:length(A);
                range([individual(i)]) = [];
                mutatedIndividual(i) = range(randi([1,length(R)-1]));
            end
        end
    end 
end

