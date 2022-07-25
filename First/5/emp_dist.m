function [ res ] = emp_dist( mu, sigmasqr, n )
    res = sqrt(n).*(Sn_n(mu, sigmasqr, n) - mu);
end

