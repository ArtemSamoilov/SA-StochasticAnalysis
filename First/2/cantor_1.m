function [x1,F1, x2,F2] = cantor_1(n,eps)
    if nargin < 1
        n = 1;
    end
    if nargin < 2
        eps = 1e-20;
    end
    m = round(-log(eps)/log(9));
    bern1 = Ber(0.5,n,m);
    deg = -(1:m)';
    x1 = 2 * bern1 * 3.^deg;
    F1 = bern1 * 2.^deg;
    bern2 = ones(n,m)- bern1;
    x2 = 2 * bern2 * 3.^deg;
    F2 = bern2 * 2.^deg;
end