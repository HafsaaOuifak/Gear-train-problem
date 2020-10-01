
function [BestChrom]  = GeneticAlgorithm (M , N, MaxGen , Pc, Pm , Er , obj)


%%  Initialization
[ population ] = initialization(M, N);
for i = 1 : M
    population.Chromosomes(i).fitness = obj( population.Chromosomes(i).Gene(:) );
end

g = 1;
disp(['Generation #' , num2str(g)]);

%% Main loop
for g = 2 : MaxGen
    


    
    for k = 1: 2: M
        % Selection
        [ parent1, parent2] = selection(population);
        
        % Crossover
        
        [child1 , child2] = crossover(parent1 , parent2, Pc, 'single');
        
        % Mutation
        
        [child1] = mutation(child1, Pm);
        [child2] = mutation(child2, Pm);
        
        newPopulation.Chromosomes(k).Gene = child1.Gene;
        newPopulation.Chromosomes(k+1).Gene = child2.Gene;
    end
    
     % Calcualte the fitness values
    for i = 1 : M
        newPopulation.Chromosomes(i).fitness = obj( population.Chromosomes(i).Gene(:) );
    end
    % Elitism
    [ newPopulation ] = elitism(population, newPopulation, Er);
    
    population = newPopulation;
    
    best_fitness_found = population.Chromosomes(1).fitness;
    disp(['In Generation #' , num2str(g) , ' Best Fitness is ' ,  num2str(best_fitness_found)]);
    
    
end

for i = 1 : M
    population.Chromosomes(i).fitness = obj( population.Chromosomes(i).Gene(:) );
end


[max_val , indx] = sort([ population.Chromosomes(:).fitness ] , 'descend');
    
BestChrom.Gene    = population.Chromosomes(indx(1)).Gene;
BestChrom.Fitness = population.Chromosomes(indx(1)).fitness;



end