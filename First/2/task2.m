%% Task 2

%% Subtask 1
clear;
clc;
n = 10000;

[x, F_emp] = cantor(n, eps);
[x, ind] = sort(x);
F_emp = F_emp(ind);
stairs(x,F_emp, 'b');

hold on;

ecdf(x)
grid on;
xlabel('x');
ylabel('F(x)');
legend({'Empirical', 'Theoretical'});


%% Subtask 1 - Kolmogorov
accepted = 0;
declined = 0;
n = 10000;
alpha = 0.05; 
k = 10000;

for hh = 1:1000

    [x, F_emp] = cantor(n);
    [x, ind] = sort(x);
    F_emp = F_emp(ind);

    F_k = 1:1:length(F_emp);
    F_emp_1 = (F_k./length(F_emp)).';
    F_emp_2 = ((F_k - 1)./(length(F_emp) - 1)).';
    D_n = max(max(abs(F_emp_1 - F_emp)),max(abs(F_emp_2 - F_emp)));
    p = 1 - Kolmogorov((sqrt(n))*D_n, k);

    if p > alpha
         disp('Accepted');
        accepted = accepted + 1;
        
    else
         disp('Declined');
        declined = declined + 1;
    end   
end
num2str(100*accepted / (accepted+declined), 20)

%% Subtask 2 - Symmetrical
clear;
clc;
alpha = 0.05;
k = 1000;
n = 100000;

x = cantor(n);
ecdf(x);
hold on;
ecdf(1-x);
grid on;
xlabel('x');
ylabel('F(x)');
legend({'F(X)','F(1-X)'});


%% Subtask 2 - Smirnov

x1 = cantor(n);
x2 = 1 - cantor(n);
n = length(x1);
m = length(x2);
D_nm = Smirnov(x1.',x2.');
p = 1 - Kolmogorov((sqrt((n*m)/(n+m)))*D_nm,k);
if  p > alpha
    disp('Accepted');
else
    disp('Declined');
end   

%% Self-similarity
clc;
clear;
alpha = 0.95;
[x1,F1,x2,F2] = cantor_2(10000, 1e-13);

plot(F1,x1, F2,x2,'r--');
grid on;
legend({'F(X/3)','F(X),X \in [0;1/3]'});
xlabel('X');
ylabel('F(X)');
accepted = 0;
declined = 0;
n = length(x1);
m = length(x2);
D_nm = Smirnov(x1.',x2.');
p = 1 - Kolmogorov((sqrt((n*m)/(n+m)))*D_nm,1000);
if p > alpha
     disp('Accepted');
    accepted = accepted +1;
else
     disp('Denied');
    declined = declined +1;
end  
num2str(100*accepted / (accepted+declined), 20)


%% Subtask 3
clear;
clc;
n = 100000;

[x_emp, F_emp] = cantor(n);
[F_teor, x_teor] = ecdf(x_emp);

iter = 1:1:length(x_emp);
EX_teor = sum(x_teor)/length(x_teor);
EX_emp = cumsum(x_emp.')./iter;
semilogx(iter, EX_emp, iter, 0.5*ones(1,length(iter)),'r--');
ylabel('ES_n');
grid on;
xlabel('n');
title('Expectancy');



DX_teor = sum(x_teor.^2)/length(x_teor) - EX_teor.^2;
DX_emp = cumsum((x_emp.').^2)./iter - EX_emp.^2;
figure;


semilogx(iter, DX_emp, iter, DX_teor*ones(1,length(iter)),'r--');
grid on;
ylabel('DS_n');
xlabel('n');
title('Dispersion');

    
