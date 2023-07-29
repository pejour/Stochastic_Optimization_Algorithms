function path = GeneratePath(pheromoneLevel, visibility, alpha, beta)
    
    % selecting the starting node
    tabuList = randi(length(pheromoneLevel));
    
    while length(tabuList) < length(pheromoneLevel)
        nextNode = GetNode(tabuList, pheromoneLevel, visibility, alpha, beta);
        tabuList = [tabuList nextNode];
    end
    
    path = tabuList;
end

