function [ res ] = geometrical( p, n )
    res = zeros(n,1);
    flag = ones(n,1);
    while sum(flag) >= 1
        flag2 = Ber(p, n, 1);
        res = res + not(flag2).*flag;
        flag = not(flag2).*flag;
    end 
end