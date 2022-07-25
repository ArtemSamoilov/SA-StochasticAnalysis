function y = expdispTh(lamb, x)
    if (x >= 0)
        y = 1 - exp(-lamb.*x);
    else
        y = 0;
    end
end