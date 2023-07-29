% LGP script
% g(x) = (a0 + a1x + ... + apx^p)/(b0 + b1x + ... + bqx^q)

numberOfGenerations = 100;
populationSize = 40;
numberOfGenes = 40;
tournamentProbability = 0.75;
tournamentSize = 2;
crossoverProbability = 0.8;
mutationProbability = 0.02;

% variable registers
M = 3;
R = zeros(1,M);
% constant registers (set once and for all)
N = 3;
C = [1 3 10];
% global set A = R U C
A = [R C];
operatorSet = ['+','-','*','/'];

% Initialize chromosomes
population = InitializePopulation(A, R, operatorSet, populationSize, numberOfGenes);

% Decoding and evaluation
functionData = LoadFunctionData;

% let's use the struct concept to store the chromosomes
s = struct([]);
for i=1:populationSize
    s(i).name = population(i,:);
end

for generation = 1:numberOfGenerations
    
    maximumFitness = 0;
    fitnessList = zeros(1,populationSize);
    
    for j = 1:populationSize

        chromosome = s(j).name;
        dataResult = DecodingEvaluation(chromosome, functionData, A, R);

        f = Fitness(functionData,dataResult);
        fitnessList(j) = f;

        if (fitnessList(j) > maximumFitness ) 
            maximumFitness  = fitnessList(j);
            iBestIndividual = j;
            bestLGPChromosome = chromosome;
        end

    end
    
    temporaryPopulation = s;  
    for i = 1:2:populationSize

        % Tournament Selection
        i1 = TournamentSelection(fitnessList, tournamentProbability, tournamentSize);
        i2 = TournamentSelection(fitnessList, tournamentProbability, tournamentSize);

        % Crossover
        r = rand;
        if (r < crossoverProbability) 
             individual1 = s(i1).name;
             individual2 = s(i2).name;
             [newIndividual1, newIndividual2] = Cross(individual1, individual2);
             temporaryPopulation(i).name = newIndividual1;
             temporaryPopulation(i+1).name = newIndividual2;
        else
             temporaryPopulation(i).name = s(i1).name;
             temporaryPopulation(i+1).name = s(i2).name;     
        end
    end
    
    % Mutations
    for i = 1:populationSize
        tempIndividual = Mutate(temporaryPopulation(i).name,mutationProbability, R, A);
        temporaryPopulation(i).name = tempIndividual;
    end
    temporaryPopulation(1).name = population(iBestIndividual,:);
    s = temporaryPopulation;

    
end

bestLGPChromosome

% Let's store the the best LGP chromosome found in a file BestChromosome.m
fileID = fopen('BestChromosome.m','w');
fprintf(fileID,'function bestLGPChromosome = BestChromosome\n');
fprintf(fileID,'bestLGPChromosome = [\n');
fprintf(fileID,'%d\n',bestLGPChromosome);
fprintf(fileID,'];\n');
fclose(fileID);


