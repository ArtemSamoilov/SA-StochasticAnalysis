function [] = func_ber(N, lambda) 
    t = zeros(1, N);
    T = 0;
    i = 0;
    Wt = zeros(1, N);
    N = N-1;
    
    while i <= N
        xi = exprnd(1/(2*lambda), 1);
        T = T + xi;    
        if Ber((1 + cos(T))/2, 1, 1)
            i = i + 1;
            Wt(i) = i;
            t(i) = T;
        end    
    end

    plot(t, lambda.*(1 + cos(t)));
    hold on;
    plot(t, Wt);
    ylim([0 N]);
    xlim([0 100]);
    xlabel('t');
    ylabel('N');
    legend('lambda(t)', 'W(t)');
end