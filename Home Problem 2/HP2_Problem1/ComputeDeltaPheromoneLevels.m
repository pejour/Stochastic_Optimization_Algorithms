function deltaPheromoneLevel = ComputeDeltaPheromoneLevels(pathCollection,pathLengthCollection)
    numberOfCities = length(pathCollection(1,:));
    
    % lower limit on the pheromone level : 10^(-15) on any edge =>
    deltaPheromoneLevel = 10^(-15)*ones(numberOfCities,numberOfCities);
    % loop for each ant
    for k = 1:length(pathLengthCollection)
        deltaPheromoneLevelk = zeros(numberOfCities,numberOfCities);
        for i=1:numberOfCities
            indexNode = find(pathCollection(k,:)==i);
            if indexNode == numberOfCities
                deltaPheromoneLevelk(i,pathCollection(k,1)) = 1/pathLengthCollection(k);
            else
                deltaPheromoneLevelk(i,pathCollection(k,indexNode+1)) = 1/pathLengthCollection(k);
            end
        end
        deltaPheromoneLevel = deltaPheromoneLevel + deltaPheromoneLevelk;
    end
end

