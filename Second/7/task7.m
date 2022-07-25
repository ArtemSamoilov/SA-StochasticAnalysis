%% Task 7

%% Subtask 1
clc;
clear;

x = linspace(-1, 1);
y = x;
[X, Y] = meshgrid(x, y);

F = (X.^3).*sin(1./X) + 10.*X.*Y.^4.*cos(1./Y);
F(X.^2 + Y.^2 > 1) = NaN;
surf(X, Y, F);
hold on;
n = 1e5;
initmin = 0;

for i = 1:n
    addit = 1;   
    psi = 2*pi*rand;
    x = sqrt(addit)*cos(psi);
    y = sqrt(addit)*sin(psi);
    func_val = initfunc(x, y);
    if (func_val < initmin)
        initmin = func_val;
        min_x = x;
        min_y = y;
    end
end

num2str(min_x,5)
num2str(min_y,5)
num2str(initmin,5)

plot3(min_x, min_y, initmin, 'r*');
xlabel('x_1');
ylabel('x_2');
grid on;
hold off;

disp('-----');

%% Subtask 2
n = 100000;

F = @(x_1, x_2) (x_1.^3).*sin(1./ x_1) + 10 .* x_1.*(x_2.^4).*cos(1./x_2);
[X, Y] = generator(n);
func_val = F(X, Y);
initmin = cummin(func_val);
semilogx(0,-1.2);

hold on;
stairs(1:1:n, initmin(1:n));
xlabel('n');
ylabel('F_{min}');
hold off;

st = 1;
n = 100;
s = 0;
t0 = 1;
k = 5000;
for kk = 1 : k
    [initmin, x] = annealing(t0, n);
    if initmin < st
        st = initmin;
    end
    min_x = x(1);
    min_y = x(2);
    s = s + initmin;
end

num2str(s/k,5)
num2str(st, 5)





