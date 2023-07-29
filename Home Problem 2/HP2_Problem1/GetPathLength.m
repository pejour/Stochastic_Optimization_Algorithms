function pathLength = GetPathLength(path,cityLocation)
    pathLength = 0;
    for i = 1:length(path)-1
        distanceij = sqrt((cityLocation(path(i),1)-cityLocation(path(i+1),1)).^2 + (cityLocation(path(i),2)-cityLocation(path(i+1),2)).^2);
        pathLength = pathLength + distanceij;
    end
    pathLength = pathLength + sqrt((cityLocation(path(length(path)),1)-cityLocation(path(1),1))^2 + (cityLocation(path(length(path)),2)-cityLocation(path(1),2))^2);
end

