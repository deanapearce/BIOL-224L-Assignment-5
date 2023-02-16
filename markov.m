function [chain] = markov(x,pi,P,n)

  chain = zeros(1, n);

  chain(1,1) = randsample(x, 1, true, pi);
  for k = 2:n	
  
    chain(1,k) = randsample(x, 1, true, P(chain(1,k-1),:));
  end
 end