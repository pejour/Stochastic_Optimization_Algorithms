% This function should return the value of the polynomial f(x) = a0x^0 + a1x^1 + a2x^2 ...
% where a0, a1, ... are obtained from polynomialCoefficients.

function value = GetPolynomialValue(x, polynomialCoefficients)

value = 0;
nbCoefficients = length(polynomialCoefficients);

for i = 1:nbCoefficients
    value = value + polynomialCoefficients(i)*x.^(i-1);
    % at each loop we add to the current value the following term of the
    % polynomial expression at the point "x"
end
