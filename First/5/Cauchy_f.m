function [ f ] = Cauchy_f(a, b, x)
    f = atan((x-a)/b)/pi + 0.5;
end

