function [t_1,F_1,t_2,F_2] = cantor_2(n, eps)
    if nargin < 1
        n = 1; 
    end
    if nargin < 2
        eps = 1e-10;
    end
    m = round(-log(eps)/log(9));
    bern = Ber(0.5,n,m);
    deg = -(1:m)';
    x = (2 * bern * 3.^deg);
    x1 = x./3;
    [t_1,F_1] = ecdf(x1); 
    x2 = x(x<1/3);
    [t_2,F_2] = ecdf(x2);
end