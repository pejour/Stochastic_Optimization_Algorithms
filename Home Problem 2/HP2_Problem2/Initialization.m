function [positions,velocities] = Initialization(xmax, xmin, alpha, deltaT, N, n)

    positions = zeros(N,2);
    velocities = zeros(N,2);

    for i=1:N
        for j=1:2
            r = rand;
            positions(i,j) = xmin + r*(xmax - xmin);
        end
    end

    for i=1:N
        for j=1:2
            r = rand;
            velocities(i,j) = (alpha/deltaT) * (-(xmax-xmin)/2 + r*(xmax - xmin));
        end
    end
end

