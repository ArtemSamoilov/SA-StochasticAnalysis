function [X,Y] = expdist(lambda,n)
    Y = rand(1,n);
    X = -log(1 - Y)./lambda;
end    
