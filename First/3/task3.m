%% Task 3

%% Subtask 1
lambda = 5;
n = 10000;
[X, F] = expdist(lambda,1,n);
[X_exp,ind] = sort(X);
F_exp = F(ind);

hold on;
plot(X_exp,F_exp);
x = linspace(min(X),max(X),n);
ecdf(X_exp);

hold off;
xlabel('x');
ylabel('F(x)');
title('Exponential');
legend('Empirical','Theoretical');  

%% Subtask 1 - memory
n = 10000;
lambda = 0.5;
t = 0;
m = 1;
[X, F] = expdist(lambda,1,n);
X_t = X(X>t); 
X_m = X(X>m);
histogram(X_t, 'Normalization', 'probability');
hold on;
histogram(X_m - m, 'Normalization', 'probability');
xlabel('k');
ylabel('P_k');
hold off;

%% Subtask 1 - Y = min(...)

n = 1000;
lambda_min = 1;
lambda_max = 5;
[X,F_X] = Y_min(n,lambda_min,lambda_max);

hold on;
plot(X,F_X);
xlabel('x');
ylabel('F(x)');

lambda = linspace(lambda_min,lambda_max,n);
Lamb_sum = sum(lambda); 
plot(X,expdispTh(Lamb_sum,X),'b--');

xlabel('x');
ylabel('F(x)');
title('Y = min(X_1,...,X_n)');
legend('Empirical','Theoretical');  
hold off;

%% Subtask 2
n = 100000;
lambda = 5;  
X_Poisson = Poisson(lambda,n);

hold on;
H1 =  histogram(X_Poisson);
H1.Normalization = 'probability';
x = min(X_Poisson):1:max(X_Poisson);
p = poisspdf(x,lambda);
bar(x,p);

xlabel('x');
ylabel('F(x)');
title('Poisson','FontSize',14);
legend('Empirical','Theoretical');  
hold off;
clear;
%% Subtask 3
p = 0.03;
n = 50;
m = 1000;
lambda = n*p;
k = n;
r = k - 1;
alpha = 0.05;
Binom_Y = Bin(p,n,m);   
hold on;

H = histogram(Binom_Y);
H.Normalization = 'probability';
x = min(Binom_Y):1:max(Binom_Y);
p = poisspdf(x,lambda);

bar(x,p,'b');
xlabel('n');
ylabel('count');
legend('Binom','Poisson');

poiss_all = poisspdf(x,lambda);
v = zeros(1,length(x));
for i = 0:length(x)-1
    v(i+1) = length(Binom_Y(Binom_Y == i));
end

v_all = v./m;
Xi_2 = m*sum(((v_all - poiss_all).^2)./poiss_all);
hold off;

X = chi2inv(alpha,r);
if  Xi_2 < X
    disp('Accepted');
else
    disp('Declined');
end 
clear;

%% Subtask 4
clc
clear

n = 10000;
fi = random('uniform',0,2*pi,[1,n]);
lambda = 0.5;
[X_exp_0, F_exp_0] = expdist(lambda,1,n);
omega = X_exp_0;

hold on;
xi = (sqrt(omega)).*(cos(fi));
[F, X] = ecdf(xi);
plot(X,F,'b');
x = linspace(min(xi),max(xi),n);
y1 = cdf('Normal',x,0,1);
plot(x,y1,'r--');
legend('Empirical','Theoretical');
xlabel('x');
ylabel('F(x)');
hold off;


figure;
hold on;
teta = (sqrt(omega)).*(sin(fi));
[F2, X2] = ecdf(teta);
plot(X2,F2,'b');
x2 = linspace(min(teta),max(teta),n);
y2 = cdf('Normal',x2,0,1);
plot(x2,y2,'r--');
legend('Empirical','Theoretical');
xlabel('x');
ylabel('F(x)');
hold off;

alpha = 0.05;
t = tStud(xi,teta);
if (t >= tinv(alpha/2,n-1)) && (t <= tinv(1 - alpha/2,n-1))
    disp('Accepted');
else
    disp('Declined');
end 

F = Fisher(xi,teta);
if  ((F >= finv(alpha/2,n-1,n-1))) && (F <= finv(1 - alpha/2,n-1,n-1))
    disp('Accepted');
else
    disp('Declined');
end 

clear;

