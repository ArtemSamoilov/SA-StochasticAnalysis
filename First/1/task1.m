%% Task 1

%% Subask 1
p = 0.5;
n = 100;
count = 1e6;
mu = n*p;

x_l = (mu + 3 * sqrt(n*p*(1-p)) * [-1 1]);
Binom = Bin(p,n,count);
hold on;
grid on;

xlim([x_l]);

histogram(Binom, 'Normalization', 'probability','Binmethod','integers');
x = floor(x_l(1)):ceil(x_l(2));
y = binopdf(x,n,p);
bar(x, y, 0.5);

legend({'Empirical', 'Theoretical'});
xlabel('k');
ylabel('p_k');
%% Subtask 2
clear;
clc;
p = 0.20;
n = 30;

Geom = geometrical(p,n);
histogram(Geom, 'Normalization', 'probability');
hold on;
grid on;
xlim([-1,30]);
ylim([0,p+0.01]);
x = linspace(0,30,31);
y = geopdf(x,p);
bar(x, y, 0.5);
legend({'Empirical', 'Theoretical'});
xlabel('k');
ylabel('p_k');

%% Subtask 2 - memory
clear;
clc;
p = 0.2;
m = 4;
n = 1;
tmp = 100000;



Geom = geometrical(p, tmp);
res2 = Geom(Geom >= m + n);
Geom = geometrical(p,tmp);
res1 = Geom(Geom >= n);

hold on;
grid on;
xlim([-1 30]);

histogram(res1,'Normalization', 'probability','Binmethod','integers');
histogram(res2 - m ,'Normalization', 'probability','Binmethod','integers');
legend({'P(X)\geq n', 'P(X \geq m+n)'});
xlabel('k');
ylabel('p_k');


%% Subtask 3
clear;
clc;
n = 100000;
m = 1;
p = 0.5;


X = 2.*Ber(p,n,m) - 1; % 1 or -1
x_lin = linspace(1,n,length(cumsum(X)./sqrt(n)));
hold on;
plot(x_lin, cumsum(X)./sqrt(n));
ylabel('S_n');
xlabel('n');

