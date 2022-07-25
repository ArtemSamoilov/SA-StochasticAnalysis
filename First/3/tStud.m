function t = tStud(X,Y)
    n = length(X);
    X_line = sum(X)/n;
    S_x = (sum((X - X_line).^2))/(n-1);
    m = length(Y);
    Y_line = sum(Y)/m;
    S_y = (sum((Y - Y_line).^2))/(m-1);
    t = (X_line - Y_line)/sqrt(S_x/n + S_y/m);
end