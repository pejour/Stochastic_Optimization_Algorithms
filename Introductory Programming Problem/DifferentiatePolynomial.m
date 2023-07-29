% This method should return the coefficients of the k-th derivative (defined by
% the derivativeOrder) of the polynomial given by the polynomialCoefficients (see also GetPolynomialValue)

function derivativeCoefficients = DifferentiatePolynomial(polynomialCoefficients, derivativeOrder)

nbPolynomialCoefficients = length(polynomialCoefficients);
nbDerivativeCoeff = nbPolynomialCoefficients - derivativeOrder;
derivativeCoefficients = [];

if nbDerivativeCoeff > 0
    % if nbDerivativeCoeff <= 0, we return []
    
    for i = derivativeOrder+1:nbPolynomialCoefficients
        % at the k-th derivative the coefficients of the polynomial are :
        % ai' = ai*(factorial(i-1)/factorial(i-1-k)) for i=k+1:N (there are N = n+1
        % coefficients : a0,...,an !!)
        
        % calculation of factorial(i-1) and factorial(i-1-k) for i=k+1:N :
        factoriali_1 = 1;
        factoriali_1_derivativeOrder = 1;
        
        for j = 1:i-1
            factoriali_1 = factoriali_1*j;
        end
        for k = 1:i-1-derivativeOrder
            factoriali_1_derivativeOrder = factoriali_1_derivativeOrder*k;
        end

        derivativeCoefficients = [derivativeCoefficients polynomialCoefficients(i)*(factoriali_1/factoriali_1_derivativeOrder)];
        %derivativeCoefficients = [derivativeCoefficients polynomialCoefficients(i)*(factorial(i-1)/factorial(i-derivativeOrder-1))];
    end
    
else if derivativeOrder == 0
    derivativeCoefficients = [derivativeCoefficients polynomialCoefficients];
    % in the case k=0, we just return polynomialCoefficients (f^(0) = f)
end
    
end