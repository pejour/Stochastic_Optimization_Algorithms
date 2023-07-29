% First compute the function value, then compute the fitness
% value; see also the problem formulation.

function fitness = EvaluateIndividual(x)
    % Let's compute g(x1,x2)(function value)
    g = (1.5-x(1)+x(1)*x(2))^2 + (2.25-x(1)+x(1)*x(2)*x(2))^2 + (2.625-x(1)+x(1)*x(2)*x(2)*x(2))^2;
    % The fitness value should be taken as the inverse of g
    fitness = 1/g;
end