function [t1, F_1_sort] = Y_min(n,lambda_min,lambda_max)
    lambda = linspace(lambda_min,lambda_max,n);
    Y = random('uniform',0,1,n);
    X = - (log(1 - Y))./lambda;
    
    %disp(length(lambda));
    %disp(size((log(1 - Y))));
    %disp(size(X));
    Z = min(X);
    %disp(Z);

    t1 = linspace(min(Z),max(Z),length(Z));
    F_1 = zeros(length(Z),1);
    P_x = 0;
    
    for i = 1:length(t1)
         for j = 1:length(X)
              if (Z(j) < t1(i))
                    P_x = P_x + 1;
              end  

         end  
         F_1(i) = P_x./n; 
         P_x = 0;

    end
    F_1_sort = sort(F_1);
end 