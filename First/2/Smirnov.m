function D_nm = smirnov(X_m,X_n)
        m = length(X_m);
        n = length(X_n);
        X_mn = cat(2,X_m,X_n);
        [X_mn,ind] = sort(X_mn);
        i = linspace(1, n+m, n+m);
         
        delta_plus = cat(2,zeros(1,m),ones(1,n));
        delta_plus = delta_plus(ind);
        S_plus = (i.*n)./(m+n) - cumsum(delta_plus);
        D_mn_plus = ((m+n).*max(abs(S_plus)))./(m*n);
        
        delta_minus = cat(2,ones(1,m),zeros(1,n));
        delta_minus = delta_minus(ind);
        S_minus = (i.*m)./(m+n) - cumsum(delta_minus);
        D_mn_minus = ((m+n).*max(abs(S_minus)))./(m*n);
        
        D_nm = max(D_mn_plus,D_mn_minus);
        
end