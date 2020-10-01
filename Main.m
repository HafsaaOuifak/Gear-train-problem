
% main 

clear
clc

%% controling paramters of the GA algortihm
Problem.obj = @GearTrain;
Problem.nVar = 16;

M = 30; % number of chromosomes (cadinate solutions)
N = Problem.nVar;  % number of genes (variables)
MaxGen = 500;
Pc = 0.85;
Pm = 0.01;
Er = 0.2;

[BestChrom]  = GeneticAlgorithm (M , N, MaxGen , Pc, Pm , Er , Problem.obj)