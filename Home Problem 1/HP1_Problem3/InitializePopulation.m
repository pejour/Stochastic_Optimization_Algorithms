function population = InitializePopulation(populationSize,numberOfGenes)

    population = zeros(populationSize,numberOfGenes);
    % for each individual of the population (iteration i) and we set random
    % binary values (0 or 1) to each genes of the chromosome
    for i=1:populationSize
        % randi([imin,imax],n,m) returns a n by m matrix with random integer
        % values between imin and imax.
        population(i,:) = randi([1,2],1,numberOfGenes)-1;

    end
end
