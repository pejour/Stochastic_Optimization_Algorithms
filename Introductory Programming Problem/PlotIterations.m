% This method should plot the polynomial and the iterates obtained
% using NewtonRaphsonStep (if any iterates were generated).

function PlotIterations(polynomialCoefficients, iterationValues)

X = -5:0.01:5;

Y_function = GetPolynomialValue(X, polynomialCoefficients);
Y_iteration = GetPolynomialValue(iterationValues, polynomialCoefficients); 

% we plot the polynomial (Y_function) and the iterates from
% NewtonRaphsonStep (Y_iteration)
plot(iterationValues,Y_iteration,'o',X,Y_function);


