function [ res ] = Sn_n( mu, sigma_sqr, n )
    clear sum;
    m = 10000;
    s = sum(normrnd(mu, sqrt(sigma_sqr), [n, m]),2);
    res = s./m; 
end



