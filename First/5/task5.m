%% Task 5

%% Subtask 1 - LLN
clear;
clc;

mu = 5;
sigma_sqr = 2;
LN = 10000000;

n = linspace(1, LN, LN);
cumsumres = cumsum(normrnd(mu, sqrt(sigma_sqr), [1, LN]));
semilogx(n, cumsumres./n, 'r');

hold on;
grid on;
plot(n, mu*ones(1, length(n)), 'b');
xlabel('n');
ylabel('S_n/n');
legend({'S_n/n', 'mu'});
hold off;
 
%% Subtask 1 + CLT
clear;

mu = 0.5;
sigma_sqr = 1;
LN = 10000;
empyr = emp_dist(mu, sigma_sqr, LN);

histogram(empyr, 'Normalization', 'pdf');

x = linspace(-5, 5);
hold on;
grid on;
plot(x, norm_f(x), 'r', 'LineWidth', 2);
xlabel('x');
ylabel('P');
legend({'Empirical', 'Theoretical'}); 

%% Subtask 2
clc;
clear;

n = 10000;
mu = 5;
sigma = 3;
alpha_1 = 0.05;
alpha_2 = 0.95;

X = random('Normal',mu,sigma,[1,n]);
grid = linspace(1, length(X), length(X));

EX = cumsum(X)./grid;
DX = cumsum((X).^2)./grid - EX.^2;
t = tinv(1-alpha_1/2,(0:1:n-1));
a1 = EX + (sqrt(DX)./sqrt(grid)).* t;
b1 = EX - (sqrt(DX)/sqrt(grid)).* t;

semilogx(grid, a1, 'r', grid, b1, 'g', grid, ones(1,n)*mu, 'b--');
legend({'Probable means','Probable means', 'mu'});
xlabel('n');
ylabel('Exp');
title('Expectation');


xi1 = chi2inv((1- alpha_2)/2,(0:1:n-1));
xi2 = chi2inv((1+ alpha_2)/2,(0:1:n-1));
a2 = ((0:1:n-1).*(DX))./xi1;
b2 = ((0:1:n-1).*(DX))./xi2; 
figure;
semilogx(grid, a2,'r', grid, b2, 'g', grid, ones(1,n)*sigma^2, 'b--');
legend({'Probable means','Probable means', 'sigma^2'});
xlabel('x');
ylabel('Disp');
title('Dispersion');


%% Subtask 3
clear;
clc;

a = 0;
b = 2;
LN = 1000;
x_left = -10;
x_right = 10;
n = linspace(1, LN, LN);

cumsumres = Cauchy(a, b, 1, LN);
cumsumres = cumsum(cumsumres);
semilogx(n, cumsumres./n, '+');
hold on;

plot(n, zeros(1, numel(n)), 'r');
xlabel('n');
ylabel('S_n/n');
legend({'S_n/n', 'mu'});
hold off;

figure;
cauch = zeros(1, LN);

for i = 1:LN
   cauch(i) = sum(Cauchy(a, b, 1, LN)) /LN; 
end

ecdf(cauch);      
xlabel('X');
ylabel('F');
xlim([-5, 5]);
hold on;

x = linspace(x_left, x_right, LN);
y = Cauchy_f(a, b, x);
plot(x, y, 'r--');
hold off;
legend({'Empirical', 'Theoretical'});
ylim([0, 1]);











