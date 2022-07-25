function [ Sum ] = Kolmogorov(x,k) 
    Sum = 0;
    for i = 1:k
       Sum = Sum + ((-1)^i)*exp(-2*(i^2)*((x.')^2));
    end
    Sum = 1+2*Sum;
end

