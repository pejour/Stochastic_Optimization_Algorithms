%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%
% Penalty method for minimizing
%
% (x1-1)^2 + 2(x2-2)^2, s.t.
%
% x1^2 + x2^2 - 1 <= 0.
%
%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

% The values below are suggestions - you may experiment with
% other values of eta and other (increasing) sequences of the
% µ parameter (muValues).


muValues = [1 2 3 5 10 20 30 50 70 100 200];%250 500 750 1000];
eta = 0.0001;
xStart =  [1;2]; %[Specify as a vector with two components, see Step 3 of the problem formulation];
gradientTolerance = 1E-6;

% we collect the values of x(1) and x(2) for the different values of mu
X = [];%[xStart(1)];
Y = [];%[xStart(2)];

for i = 1:length(muValues)
 mu = muValues(i);
 x = RunGradientDescent(xStart,mu,eta,gradientTolerance);
 sprintf('x(1) = %3f, x(2) = %3f mu = %d',x(1),x(2),mu)
 X = [X x(1)];
 Y = [Y x(2)];

end

% Let's plot the values of x(1) and x(2) in function of mu :
figure(1);
plot([muValues],X,'o');
title('Values of x in function of mu');
figure(2);
plot([muValues],Y,'o');
title('Values of y in function of mu');

