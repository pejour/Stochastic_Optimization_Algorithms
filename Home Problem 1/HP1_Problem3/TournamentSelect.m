function selectedIndividualIndex = TournamentSelect(fitnessList, tournamentProbability, tournamentSize)

%function iSelected = TournamentSelect(fitness,pTournament)
    numberIndividuals = length(fitnessList);
    individualIndex = [];
    selectedIndividualIndex = -1;
    
    for i=1:tournamentSize
        newIndex = randi([1,numberIndividuals]);
        while ismember(newIndex,individualIndex)
            newIndex = randi([1,numberIndividuals]);
        end
        individualIndex = [individualIndex newIndex];
    end
    
    % Let's order the indexes in individualIndex so that the first index
    % corresponds to the highest fitness value ,the second index to the second
    % highest fitness value,..., and the last one to the lowest fitness value
    
    for i=1:length(individualIndex)
        % for each index in individualIndex
        k = i;
        j = i-1;
        while j>=1
            c = 0;
            % we compare the fitness of both kth and jth index
            if fitnessList(individualIndex(k)) > fitnessList(individualIndex(j))
                % Let's switch kth index and jth index
                c = individualIndex(j);
                individualIndex(j) = individualIndex(k);
                individualIndex(k) = c;
            end
            k = k-1;
            j = j-1;
        end
    end
    
    
    while selectedIndividualIndex == -1
        randomNumber = rand;
        if (randomNumber < tournamentProbability) || (length(individualIndex) == 1)
            % The first index always corresponds to the individual with the
            % highest fitness value
            selectedIndividualIndex = individualIndex(1);
        else
            individualIndex = individualIndex(2:end);
        end
    end
    
end

