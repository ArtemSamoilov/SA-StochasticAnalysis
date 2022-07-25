function [initmin, x] = annealing(t_0,n)
    x = [0,0];
    initmin = inf;
    t_i = t_0;
    for i = 1:n
        x_i = randn(1,2)*sqrt(t_0) + x;
        min_i = (x_i(1) - 1)^2 + 100*(x_i(2) - (x_i(1))^2)^2;

        if min_i >= initmin
            p = exp((initmin - min_i)/t_i);
            x = (x_i - x)*(rand(1,1) < p) + x;
            initmin = (min_i - initmin)*(rand(1,1) < p) + initmin;
        else
            x = x_i;
            initmin = min_i;
        end  

        t_i = t_i/i^3;
    end
end
