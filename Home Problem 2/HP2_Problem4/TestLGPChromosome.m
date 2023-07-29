
bestLGPChromosome = BestChromosome;
functionData = LoadFunctionData;

% variable registers
M = 3;
R = zeros(1,M);
% constant registers (set once and for all)
N = 3;
C = [1 3 10];
% global set A = R U C
A = [R C];
operatorSet = ['+','-','*','/'];

dataResult = DecodingEvaluation(bestLGPChromosome, functionData, A, R);

% Let's plot the original Data (yk) and our best fit (^yk)
figure(1);
plot(functionData(:,1),functionData(:,2),'o',functionData(:,1),dataResult(:,2),'x');
title('Comparison between the original data and our best fit');
xlabel('x');
ylabel('y');
legend('Original data','Best fit');



