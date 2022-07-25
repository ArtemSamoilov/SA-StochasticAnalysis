%% Task 4

%% Subtask 1 
n = 1000;
a = -5;
b = 5;
x0 = 0;
gamma = 0.5;

x1 = Cauchy(x0, gamma, 1, n);
[f, y] = ecdf(x1);
plot(y, f)
hold on;
grid on;
x = linspace(a, b, n);
F_cauchy = 1/pi*atan((x - x0)/gamma) + 1/2;

plot(x, F_cauchy)
xlabel('x')
ylabel('P')
axis([a, b, 0, 1])
legend('Empirical','Theoretical');

%% Subtask 2
clc
clear
n = 10000;
b = Von_Neumann(n);
normplot(b)

%% Subtask 3
clear
clc
M = 3;
linsp = linspace(10, 5 * 10^4, 30);
k = 30;
t1 = zeros(1, k);
t2 = zeros(1, k);

for j = 1 : k
    n = round(linsp(j));
    a = 0;
    b = 0;
    for i = 1 : M
        tic
        Von_Neumann(n);
        a = a + toc;
    end
    t1(j) = a/M;
    for i = 1 : M
        tic
        normalp(1, n);
        b = b + toc;
    end
    t2(j) = b/M;
end
j = 1 : k;

%% SpeedCheck
plot(round(linsp), t1/10, 'r')
hold on
grid on
xlabel('n')
ylabel('t')

plot(round(linsp), t2, 'b')
legend('Task 4', 'Task 3')