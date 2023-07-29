function v = TruckModel(x, iSlope, iDataSet)

    % parameters set :
    deltaT = 0.2;
    Pp = 10;
    M = 100;
    g = 9.8;
    n = length(iSlope);
    sum = 0;
    v = zeros(n+1);
    
    Fb = (M*g/20)*Pp;
    Feb = 10; %????????????????????????????????????
    
    % we use the discretization to solve the equation 2 (Euler approach)
    for i=1:n
        alpha = GetSlopeAngle(x, iSlope(i), iDataSet);
        sum = sum + sin(alpha);
        v(i+1) = deltaT*g*sum - (deltaT*i/M)*(Fb + Feb);
    end
end

