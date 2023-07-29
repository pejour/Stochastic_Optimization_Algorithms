function mutatedIndividual = Mutate(individual, mutationProbability)

    mutatedIndividual = individual;
    for i=1:length(individual)
        randomNumber = rand;
        if randomNumber < mutationProbability
            mutatedIndividual(i) = 1-individual(i);
        end
    end 
end
