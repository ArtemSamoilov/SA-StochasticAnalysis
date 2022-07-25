function f = Cauchy(x0, gamma, n, m)
    u = rand(n, m);
    f = x0 + gamma* tan(pi*(u - 1/2));
end