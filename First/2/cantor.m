function [x,F] = cantor(n,eps)
    if nargin < 1
        n = 1;
    end
    if nargin < 2
        eps = 1e-20;
    end
    m = round(-log(eps)/log(9));
    bern = Ber(0.5,n,m);
    deg = -(1:m)';
    x = 2 * bern * 3.^deg;
    F = bern * 2.^deg;
end