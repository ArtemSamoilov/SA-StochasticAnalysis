function [w, time] = Wiener(t1, t2, x1, x2, eps, alpha)  
    if (t2 - t1 < eps)
        w = [];
        time = [];
    else
        t = (1 - alpha) * t1 + alpha * t2;
        wt = randn(1) * sqrt(alpha * (1 - alpha) * (t2 - t1)) + ...
             (1 - alpha) * x1 + alpha * x2;
        [w1, time1] = Wiener(t1, t, x1, wt, eps, alpha);
        [w2, time2] = Wiener(t, t2, wt, x2, eps, alpha);
        w = [w1 w2 wt];
        time = [time1 time2 t];
    end
end