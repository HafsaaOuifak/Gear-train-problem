
function [cost]=GearTrain(x)

%minimize the cost of the gear ratio of the gear train
%the variables should be discrete
x = x';

x1= bin2dec(num2str(x(1:4)));
x2= bin2dec(num2str(x(5:8)));
x3= bin2dec(num2str(x(9:12)));
x4= bin2dec(num2str(x(13:16)));

cost=((1/6.931)-((x3*x2)/(x1*x4)))^2;

if x1 == 0 || x4 == 0
    cost = inf;
end

cost = -1 * cost;