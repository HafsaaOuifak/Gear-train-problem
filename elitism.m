
function [ newPopulation2 ] = elitism(population , newPopulation, Er)
 
M = length(newPopulation.Chromosomes); % number of individuals 
Elite_no = round(M * Er);

[max_val , indx] = sort([ population.Chromosomes(:).fitness ] , 'descend');

 
    
for k = 1 : Elite_no
    newPopulation2.Chromosomes(k).Gene  = population.Chromosomes(indx(k)).Gene;
    newPopulation2.Chromosomes(k).fitness  = population.Chromosomes(indx(k)).fitness;
end

for k = Elite_no + 1 :  length(newPopulation.Chromosomes)
    newPopulation2.Chromosomes(k).Gene  = newPopulation.Chromosomes(k).Gene;
    newPopulation2.Chromosomes(k).fitness  = newPopulation.Chromosomes(k).fitness;
end

 


end