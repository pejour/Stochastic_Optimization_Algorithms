function [newIndividual1, newIndividual2] = Cross(individual1, individual2)

    nbInstructions = size(individual1,2)/4;
    
    % crossover points for individual1
    crossoverPoints = randi([1,nbInstructions],[1,2]);
    crossoverPoint1 = min(crossoverPoints);
    crossoverPoint2 = max(crossoverPoints);
    
    % crossover points for individual2
    crossoverPoints = randi([1,nbInstructions],[1,2]);
    crossoverPoint3 = min(crossoverPoints);
    crossoverPoint4 = max(crossoverPoints);
    
    %newIndividuals = zeros(2,nbInstructions);
    newIndividual1 = individual1;
    newIndividual2 = individual2;
    
    if crossoverPoint1 < crossoverPoint2
        newIndividual1 = [individual1(1:crossoverPoint1*4) individual2(crossoverPoint1*4+1:crossoverPoint2*4) individual1(crossoverPoint2*4+1:end)];
        newIndividual2 = [individual2(1:crossoverPoint3*4) individual1(crossoverPoint3*4+1:crossoverPoint4*4) individual2(crossoverPoint4*4+1:end)];
    end
end

