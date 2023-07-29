function newIndividuals = Cross(individual1, individual2)

    numberOfGenes = size(individual1,2);
    crossoverPoint = randi([1,numberOfGenes]);
    newIndividuals = zeros(2,numberOfGenes);

    newIndividuals(1,:)=[individual1(1:crossoverPoint) individual2(crossoverPoint+1:numberOfGenes)];
    newIndividuals(2,:)=[individual2(1:crossoverPoint) individual1(crossoverPoint+1:numberOfGenes)];
    
end

