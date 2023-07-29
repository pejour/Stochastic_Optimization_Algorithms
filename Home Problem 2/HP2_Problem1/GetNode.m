function nextNode = GetNode(tabuList, pheromoneLevel, visibility, alpha, beta)
    
    currentNode = tabuList(length(tabuList));
    
    % select the available nodes (that are not in the tabuList)
    availableNodes = [1:length(pheromoneLevel)];
    availableNodes(tabuList) = [];
    
    % Let's compute the probability of going to each available nodes
    probabilities = [];
    sum = 0;
    for k=1:length(availableNodes)
        sum = sum + pheromoneLevel(currentNode,availableNodes(k)).^alpha * visibility(currentNode,availableNodes(k)).^beta;
    end
    
    for i=1:length(availableNodes)
        term1 = pheromoneLevel(currentNode,availableNodes(i)).^alpha;
        term2 = visibility(currentNode,availableNodes(i)).^beta;
        probaNode = ( term1 * term2 )/sum;
        probabilities = [probabilities probaNode]; 
    end
    
    % Roulette-wheel selection
    r = rand;
    probaSelectedNode = max(probabilities);
    [~,index] = max(probabilities);
    probabilitiesTemp = probabilities;
    
    while probaSelectedNode < r
        probabilitiesTemp(index) = -1;
        [~,index] = max(probabilitiesTemp);
        probaSelectedNode = probaSelectedNode + probabilities(index);
    end
    
    nextNode = availableNodes(index);
end

