% This function should return the gradient of f_p = f + penalty.
% You may hard-code the gradient required for this specific problem.

function gradF = ComputeGradient(x,mu)
    gradF = zeros(2,1);
    constraint = x(1)^2 + x(2)^2 - 1; 
    if constraint <= 0
        % when the constraint is respected the penalty term = 0 (Step2, 1st
        % case)
        gradF(1) = 2*(x(1)-1);
        gradF(2) = 4*(x(2)-2);
    else
        % when the constraint is not respected, we add the penalty term to
        % f and compute the gradient (Step2, 2nd case)
        gradF(1) = 2*(x(1)-1) + 4*mu*x(1)*(x(1)^2+x(2)^2-1);
        gradF(2) = 4*(x(2)-2) + 4*mu*x(2)*(x(1)^2+x(2)^2-1);
    end
end