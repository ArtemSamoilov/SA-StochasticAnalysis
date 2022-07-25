function [w, time] = Ornstein_Uhlenbeck(t0, t1, x1, x2, eps, alpha, sigma_sqr, lambda)  
    if (t1 - t0 < eps)
        w = [];
        time = [];
    else
        t = (1 - alpha) * t0 + alpha * t1;
        wt = randn(1) * sqrt(sigma_sqr * (1-exp(-lambda * (t1-t0))) / (1 + exp(-lambda * (t1-t0)))) + (x1+x2) * exp(-lambda * (t1-t0)/2) / (1 + exp (-lambda * (t1-t0)));
        [w1, time1] = Ornstein_Uhlenbeck(t0, t, x1, wt, eps, alpha, sigma_sqr, lambda);
        [w2, time2] = Ornstein_Uhlenbeck(t, t1, wt, x2, eps, alpha, sigma_sqr, lambda);
        w = [];
        time = [];
        w = [w w1 w2 wt];
        time = [time time1 time2 t];
    end
end