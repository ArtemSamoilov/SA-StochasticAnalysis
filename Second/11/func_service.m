function [] = func_service(N, lambda)
    t = expdist(lambda, N);
    t = cumsum(t);
    chi = chi2rnd(10, [1, N]);
    addit = zeros(1, N);
    addit(1) = t(1) + chi(1); 

    for i = 2 : N
         addit(i) = t(i) + max(0, addit(i - 1) - t(i)) + chi(i);
    end
    
    [time, index] = sort([t, addit]);
    temp = [ones(1, N), -1.*ones(1, N)];
    temp = temp(index);
    count = cumsum(temp);
    last = find(temp == 1);
    time = time(1:last(end));
    count = count(1:last(end));

    hold on;
    grid on;
    stairs(time, count, '-r');
    xlim([0 time(end)]);
    ylim([0 max(count)]);
    xlabel('t');
    ylabel('N');
end

