%% Task 10

%% Subtask 1-2
clc;
clear;

n = 10;
t_0 = 0;
t_1 = 2;
eps = 0.001;
sigma_sqr = 1;
lambda = 1;
alpha = 0.3;

wt0 = randn(1) * sqrt(sigma_sqr); 
wt1 = randn(1) * sqrt(sigma_sqr * (1 - exp(-2*lambda*t_1))) + wt0 * exp(-lambda * t_1);
[W, t] = Ornstein_Uhlenbeck(t_0, t_1, wt0, wt1, eps, alpha, sigma_sqr, lambda);
W = [W wt0 wt1];

t = [t t_0 t_1];
[sort_t, ind] = sort(t);
X = W(ind);

%% 	Gauss
r = 0.5;
N = size(X,2);

epsilon = normrnd(0, sqrt(r), [1, N]);
Y = X + epsilon;
a = exp(-lambda*(sort_t(2) - sort_t(1)));
q = sigma_sqr*(1 - a^2);
X_pr = zeros(1, N);
X_pr(1) = Y(1);
R = zeros(1, N);
R(1) = r;

for i = 2 : N
    X_i = a*X_pr(i - 1);
    R_i = (a^2)*R(i -1) + q;
    h = R_i/(R_i + r);
    R(i) = (1 - h)*R_i;
    X_pr(i) = (1 - h)*X_i + h*Y(i);
end 

hold on;
h = area(sort_t,[(X_pr - 2.*sqrt(R)).' (X_pr + 2.*sqrt(R)).' - (X_pr - 2.*sqrt(R)).'], 'Facealpha', 0.2);
h(1).FaceColor = 'w';
h(2).FaceColor = 'g';
grid on;
plot(sort_t, Y,'.r');
plot(sort_t, X, 'b', 'LineWidth', 2);
xlabel('t');
ylabel('X_t');
xlim([0 1]);

%% Cauchy

r = 10;
N = length(X);
epsilon = Cauchy(0, 1, 1, N);
Y = X + epsilon;

a = exp(-lambda*(sort_t(2) - sort_t(1)));
q = sigma_sqr*(1 - a^2);
X_pr = zeros(1, N);
R = zeros(1, N);
R(1) = sigma_sqr;

for i = 2 : N
    X_i = a*X_pr(i - 1);
    R_i = (a^2)*R(i -1) + q;
    h = R_i/(R_i + r);
    R(i) = (1 - h)*R_i;
    X_pr(i) = (1 - h)*X_i + h*Y(i);
end 

hold on;
axis([0 1 -10 10]);
h = area(sort_t,[(X_pr - 2.*sqrt(R)).' (X_pr + 2.*sqrt(R)).' - (X_pr - 2.*sqrt(R)).'], 'Facealpha', 0.2);
h(1).FaceColor = 'w';
h(2).FaceColor = 'g';
grid on;
plot(sort_t, Y,'.r');
plot(sort_t, X, 'b', 'LineWidth', 2);
xlabel('t');
ylabel('X_t');
xlim([0 1]);
