function res = Poisson(lambda,n)
    res = zeros(1,n);
    i = 0;
    j = 1;
    Sum_X = zeros(1,n);
    logic_addit = zeros(1,n);
    
    while i <= n-1
        Y = random('uniform',0,1,[1,n]);
        X = - (log(1 - Y))./lambda;
        Sum_X  = Sum_X + X;
        logic = ~(Sum_X < 1);
        ind = find((logic_addit - logic) == -1);
        if ~isempty(ind)
            i = i + length(ind);
            res(1, ind) = j-1;
        end 
        j = j + 1;
        logic_addit = logic;
    end  
end