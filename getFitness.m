function R = getFitness(hitRate, ind)
for j = 1 : 6; R(j) = sum(hitRate(j).R == 1)/length(hitRate(j).R) - sum(hitRate(ind).R == 1)/length(hitRate(ind).R); 
end
