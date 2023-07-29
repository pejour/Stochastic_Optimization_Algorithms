% This function should run the Newton-Raphson method, making use of the
% other relevant functions (StepNewtonRaphson, DifferentiatePolynomial, and
% GetPolynomialValue). Before returning iterationValues any non-plottable values 
% (e.g. NaN) that can occur if the method fails (e.g. if the input is a
% first-order polynomial) should be removed, so that only values that
% CAN be plotted are returned. Thus, in some cases (again, the case of
% a first-order polynomial is an example) there may be no points to plot.

function iterationValues = RunNewtonRaphson(polynomialCoefficients, startingPoint, tolerance) 

% 1st step : x1 = x0 - f'(x0)/f''(x0) => x0 = startingPoint

% initialization of iterationValues :
iterationValues= [startingPoint];

% calculation and initialization of x_next with the startingPoint:

% calculation of the coefficients of f' and f''

functionPrime = DifferentiatePolynomial(polynomialCoefficients, 1);
functionDoublePrime = DifferentiatePolynomial(polynomialCoefficients, 2);

fPrime = GetPolynomialValue(startingPoint, functionPrime);
fDoublePrime = GetPolynomialValue(startingPoint, functionDoublePrime);

x_next = StepNewtonRaphson(startingPoint, fPrime, fDoublePrime);

while abs(x_next - startingPoint) >= tolerance
    % we add x_next (new iteration value of Newton-Raphson's method)
    iterationValues = [iterationValues x_next];
    
    % we update the startingPoint (xj <- xj+1) for the next step
    startingPoint = x_next;
    
    % we update x_next (xj+1 <- xj+2) for the next step
    fPrime = GetPolynomialValue(startingPoint, functionPrime);
    fDoublePrime = GetPolynomialValue(startingPoint, functionDoublePrime);
    
    x_next = StepNewtonRaphson(startingPoint, fPrime, fDoublePrime);
    
end

