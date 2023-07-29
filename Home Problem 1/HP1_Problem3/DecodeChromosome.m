% Note: Each component of x should take values in [-a,a], where a = maximumVariableValue.

function x = DecodeChromosome(chromosome,numberOfVariables,maximumVariableValue)

    x = zeros(1,numberOfVariables);
    lengthForVariable = length(chromosome)/numberOfVariables;
    % lengthForVariable <=> k
    
    for j=1:numberOfVariables
        % decoding the j value (loop)
        for i=1:lengthForVariable
            x(j) = x(j)+chromosome(i+numberOfVariables*(j-1))*2^(-i);
        end
        % Let's compute the final expression of the j value
        x(j) = -maximumVariableValue + 2*maximumVariableValue*x(j)/(1-2^(-lengthForVariable));
    end
end

