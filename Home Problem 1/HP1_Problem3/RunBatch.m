%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Parameter specifications
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

numberOfRuns = 100;                % Do NOT change
populationSize = 100;              % Do NOT change
maximumVariableValue = 5;          % Do NOT change (x_i in [-a,a], where a = maximumVariableValue)
numberOfGenes = 50;                % Do NOT change
numberOfVariables = 2;		   % Do NOT change
numberOfGenerations = 300;         % Do NOT change
tournamentSize = 2;                % Do NOT change
tournamentProbability = 0.75;      % Do NOT change
crossoverProbability = 0.8;        % Do NOT change


%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Batch runs
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

% Define more runs here (pMut < 0.02 and pMut > 0.02):

mutationProbability = [0 0.01 0.02 0.05 0.1 0.2 0.5 0.8 0.9 0.95 0.98 1];
numberOfPmut = length(mutationProbability);

sprintf('Mutation rate = %0.5f', mutationProbability)
maximumFitnessList002 = zeros(numberOfRuns,numberOfPmut);
for i = 1:numberOfRuns
    for j = 1:numberOfPmut %loop for all values f pmut
        [maximumFitness, bestVariableValues]  = RunFunctionOptimization(populationSize, numberOfGenes, numberOfVariables, maximumVariableValue, tournamentSize, ...
                                           tournamentProbability, crossoverProbability, mutationProbability(j), numberOfGenerations);
     sprintf('Run: %d, Pmut: %0.2f, Score: %0.10f', i, mutationProbability(j), maximumFitness)
      maximumFitnessList002(i,j) = maximumFitness;
    
    end
end




%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%% Summary of results
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

% Add more results summaries here (pMut < 0.02):
average002 = zeros(1,numberOfPmut);
median002 = zeros(1,numberOfPmut);
std002 = zeros(1,numberOfPmut);

for j=1:numberOfPmut
    average002(j) = mean(maximumFitnessList002(:,j));
    median002(j) = median(maximumFitnessList002(:,j));
    std002(j) = sqrt(var(maximumFitnessList002(:,j)));
    sprintf('PMut = %0.2f, Median: %0.10f, Average: %0.10f, STD: %0.10f', mutationProbability(j), median002(j), average002(j), std002(j))
end

figure(1);
plot(mutationProbability,median002,'o');
title('Evolution of fitness value in function of pmut');
xlabel('Mutation probability (pmut)');
ylabel('Median performance (fitness value)');