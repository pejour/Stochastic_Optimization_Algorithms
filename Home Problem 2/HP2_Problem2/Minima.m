%% This script is used to get the contour plot of log(a+f(x,y))
% let's determine the number of minima of the function :
% f(x,y) = (x^2 + y ? 11)^2 + (x + y^2 ? 7)^2


nIterations = 200;
a = 0.01;
x = linspace(-5,5);
y = linspace(-5,5);
[X,Y] = meshgrid(x,y);
f = (X.^2 + Y - 11).^2 + (X + Y.^2 - 7).^2;
Z = log(a + f);
contour(X,Y,Z,nIterations)
xlabel('x');
ylabel('y');
title('Graphic of the minima of f (in blue)');

