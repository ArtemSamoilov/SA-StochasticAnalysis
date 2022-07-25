%% Task 9

%% Wiener
clc;
clear;

alpha = 0.1;
eps = 1e-4;
t0 = 0;
t1 = 1;
wt0 = 0;
wt1 = randn(1);

[w, time] = Wiener(t0, t1, wt0, wt1, eps, alpha);
w = [w wt0 wt1];
time = [time t0 t1];
addit = sortrows([time; w]');
time = addit(:, 1);
w = addit(:, 2);

hold on;
plot(time, -2*sqrt(time), 'b');
plot(time, 2*sqrt(time), 'b');
grid on;
plot(time, w);
xlabel('t');
ylabel('W_t');

%% Wiener - trajectories
alpha = 0.1;
eps = 1e-4;
t0 = 0;
t1 = 1;
wt0 = 0;

for k = 1:10
    wt1 = randn(1);
    [w, time] = Wiener(t0, t1, wt0, wt1, eps, alpha);
    w = [w wt0 wt1];
    time = [time t0 t1];
    addit = sortrows([time; w]');
    time = addit(:, 1);
    w = addit(:, 2);
    hold on;
    grid on;
    plot(time, w);
end

plot(time, -2*sqrt(time), 'b');
plot(time, 2*sqrt(time), 'b');

xlabel('t');
ylabel('W_t');
%% Ornstein-Uhlenbeck
alpha = 0.5;
sigma_sqr = 3;
lambda = 50;
eps = 0.00001;
t0 = 0;
t1 = 1;

wt0 = randn(1) * sqrt(sigma_sqr); 
wt1 = randn(1) * sqrt(sigma_sqr * (1 - exp(-2*lambda*t1))) + wt0 * exp(-lambda * t1);

[w, time] = Ornstein_Uhlenbeck(t0, t1, wt0, wt1, eps, alpha, sigma_sqr, lambda);
w = [w wt0 wt1];
time = [time t0 t1];
addit = sortrows([time; w]');
time = addit(:, 1);
w = addit(:, 2);
hold on;
grid on;
plot(time, w);

plot(time, -2.*(sigma_sqr).*ones(1, length(time)), 'b'); 
plot(time, 2.*(sigma_sqr).*ones(1, length(time)), 'b');
ylim([-8 8]);
xlabel('t');
ylabel('W_t');

%% Ornstein-Uhlenbeck - trajectories
alpha = 0.5;
sigma_sqr = 3;
lambda = 50;
eps = 0.00001;
t0 = 0;
t1 = 1;

for kk = 1 : 10
    wt0 = randn(1) * sqrt(sigma_sqr); 
    wt1 = randn(1) * sqrt(sigma_sqr * (1 - exp(-2*lambda*t1))) + wt0 * exp(-lambda * t1);

    [w, time] = Ornstein_Uhlenbeck(t0, t1, wt0, wt1, eps, alpha, sigma_sqr, lambda);
    w = [w wt0 wt1];
    time = [time t0 t1];
    addit = sortrows([time; w]');
    time = addit(:, 1);
    w = addit(:, 2);
    hold on;
    grid on;
    plot(time, w);

end

plot(time, -2.*(sigma_sqr).*ones(1, length(time)), 'b'); 
plot(time, 2.*(sigma_sqr).*ones(1, length(time)), 'b');
ylim([-8 8]);
xlabel('t');
ylabel('W_t');




