% Here, the polynomial 10 - 2x - x^2 + x^3 is defined.
%
% Note: This is just an example! You can (and should) try
% with many different polynomials to make sure that your
% program can handle all cases.
%

polynomialCoefficients = [10 -2 -1 1];
startingPoint = 5;
tolerance = 0.000001;
iterationValues = RunNewtonRaphson(polynomialCoefficients, startingPoint, tolerance);
PlotIterations(polynomialCoefficients,iterationValues);