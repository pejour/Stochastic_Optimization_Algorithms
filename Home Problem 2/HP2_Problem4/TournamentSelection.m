function selectedIndividualIndex = TournamentSelection(fitnessList, tournamentProbability, tournamentSize)

    numberIndividuals = length(fitnessList);
    selectedFitness = zeros(1,tournamentSize);
    
    % selection of individuals for the tournament
    for i=1:tournamentSize
        newIndex = randi([1,numberIndividuals]);
        selectedFitness(i) = fitnessList(newIndex);
    end
    
    maxFitness = max(selectedFitness);
    iMax = find(fitnessList == maxFitness);
    minFitness = min(selectedFitness);
    iMin = find(fitnessList == minFitness);
    nMax = length(iMax);
    nMin = length(iMin);

    if nMax > 1 
        iMax = iMax(randi([1,nMax]));
    end
    if nMin >1 
        iMin = iMin(randi([1,nMin]));
    end
    
    r = rand;
    if r < tournamentProbability
        selectedIndividualIndex = iMax;
    else 
        selectedIndividualIndex = iMin;
    end
end

