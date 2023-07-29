% This method should perform a single step of the Newton-Raphson method.
% Note: In cases where the step cannot be completed, e.g. if f" = 0, a
% clear error message should be given.

function xNext = StepNewtonRaphson(x, fPrime, fDoublePrime)

if fDoublePrime == 0
    print("Error, the second derivative is equal to 0 at that point");
    xNext = NaN;
else
    xNext = x - fPrime/fDoublePrime;
    % xj+1 = xj - f'(xj)/f''(xj) (Newton-Raphson)
end
