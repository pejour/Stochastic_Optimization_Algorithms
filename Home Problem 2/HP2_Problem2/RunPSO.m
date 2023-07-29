%% Implementing a standard PSO algorithm :

N = 20;
xmin = -5;
xmax = 5;
alpha = 1;
deltaT = 1;
c1 = 2;
c2 = 2;
w = 1.4;
beta = 0.9;
vmax = 4;
nIterations = 200;

% step 1 : Initialize positions and velocities (xij and vij)

[positions,velocities] = Initialization(xmax, xmin, alpha, deltaT, N);


% step 2 : Evaluate each particle f(x,y)

particuleBest = positions;
globalBest = positions(1,:);

for k = 1:nIterations

    evaluation = zeros(N);
    for i=1:N
        x = positions(i,:);
        f = Evaluation(x);
        evaluation(i) = f;
    end

    % step 3 : Update best position of each particle and the best global position : xipb and xsb

    for i = 1:N
        if evaluation(i) < Evaluation(particuleBest(i,:))
            particuleBest(i,:) = positions(i,:);
        end
        if evaluation(i) < Evaluation(globalBest)
            globalBest = positions(i,:);
        end
    end

    % step 4 : Update particle velocities and positions

    for i=1:N
            for j=1:2
                r = rand;
                q = rand;
                velocities(i,j) = w*velocities(i,j) + c1*q*(particuleBest(i,j)-positions(i,j))/deltaT + c2*r*(globalBest(j)-positions(i,j))/deltaT;
                % restrict velocities :
                if velocities(i,j) > vmax
                    velocities(i,j) = vmax;
                elseif velocities(i,j) < -vmax
                    velocities(i,j) = -vmax;
                end
                % varying inertia weight
                if w > 0.3
                    w = w*beta;
                end
                positions(i,j) = positions(i,j) + velocities(i,j)/deltaT;
            end
    end
    
% step 5 : return to step 2 unless the termination criterium has been reached
end

globalBest


