function [ X ] = pareto( x, k, N)
    X = x./(unifrnd(0, 1, [1, N]).^(1/k));
end

