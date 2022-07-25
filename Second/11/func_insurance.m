function [] = func_insurance(lambda, xm, k, c, W_0, N)
    t = expdist(lambda, N);
    t = cumsum(t);
    S = pareto(xm, k, N);
    S = cumsum(S);
    
    [t_sort, index] = sort([t, t(2 : length(t))]);
    S_addit = [S, S(2 : length(S))];
    S_addit = S_addit(index);
    S_addit = [S_addit(1), S_addit(3:end), S_addit(end)];
    W = W_0.*ones(1, length(t_sort)) + c.*t_sort - S_addit; 
    
    index = find(W < 0);
    if ~isempty(index)
         W(index(1):end)= 0;
    end
    
    plot(t_sort, W, 'r');
    xlabel('t');
    ylabel('N');
    grid on
    xlim([0 t_sort(end)]);
end