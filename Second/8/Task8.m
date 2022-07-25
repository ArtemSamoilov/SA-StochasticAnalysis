%% Task 8
clear;
clc;

n = 50;
h = 2/n;
x = -1:h:1;
linsp = linspace(-1,1,1000);
y = -1:h:1;
N = 1e6;
size_x_y = length(x);

counter = zeros(size_x_y, size_x_y);
val = zeros(size_x_y, size_x_y);
location = zeros(size_x_y);

[X,Y] = meshgrid(x,y);
Mat_boundary = (((X+h).^2+Y.^2 > 1) | ((X-h).^2+Y.^2 > 1) | (X.^2+(Y+h).^2 > 1) | (X.^2+(Y-h).^2 > 1)) & (X.^2+Y.^2 <= 1);
location(X.^2+Y.^2 > 1) = NaN;
location = location + Mat_boundary;

[x_point_in, y_point_in] = find(location == 0);
[x_point_boundary, y_point_boundary] = find(location == 1);
figure;
plot(x(x_point_boundary), y(y_point_boundary), 'or', x(x_point_in), y(y_point_in), 'og');
hold on;
plot(linsp, sqrt(1-linsp.^2), 'm', linsp, -sqrt(1-linsp.^2),'m');

xlim([-1.05 1.05]);
ylim([-1.05 1.05]);
axis([-1.05 1.05 -1.05 1.05]);
grid on;
xlabel('x');
ylabel('y');
legend('Boundary points','Interior points');


ind = randsample(1:length(x_point_boundary), 1);
b_x = x_point_boundary(ind);
b_y = y_point_boundary(ind);
bound_x = x(b_x);
bound_y = y(b_y);
figure;
hold on;
plot(x, sqrt(1-x.^2), 'g', bound_x, bound_y, 'ob', x, -sqrt(1-x.^2),'g');
title('First point on circle');
xlabel('x');
ylabel('y');
legend('Circle boundary','First point')
hold off;

temp = (bound_x.^2 - bound_y.^2); 

for k = 1 : N
    tmp = [b_x - 1, b_y; b_x + 1, b_y; b_x, b_y - 1; b_x, b_y + 1];
    pos = find(~isnan([location(abs(b_x - 1), b_y) location(b_x + 1, b_y) location(b_x, abs(b_y - 1)) location(b_x, b_y + 1)]) == 1);
    if size(pos, 2) == 1 
        dir = pos;
        b_x = tmp(dir, 1);
        b_y = tmp(dir, 2);
    else
        dir = randsample(pos, 1);
        b_x = tmp(dir, 1);
        b_y = tmp(dir, 2);
        if b_y + 1 > size(location, 2) || b_x + 1 > size(location, 1) || b_y - 1 <= 0 || b_x - 1 <= 0
            pos = find(pos ~= dir);
            dir = randsample(pos, 1);
            b_x = tmp(dir, 1);
            b_y = tmp(dir, 2);
        end
    end

    if location(b_x, b_y)
        temp = (x(b_x).^2 - y(b_y).^2);
        val(b_x, b_y) = temp;
        counter(b_x, b_y) = 1;
    else
        counter(b_x, b_y) = counter(b_x, b_y) + 1;
        val(b_x, b_y) = val(b_x, b_y) + temp;
    end
 
end  

figure;
surf(X,Y,(val./counter).');    
xlabel('x');
ylabel('y');
zlabel('f');

figure;
Z = X.^2-Y.^2;
Z(X.^2 + Y.^2 > 1) = NaN;
surf(X,Y,Z);
xlabel('x');
ylabel('y');
zlabel('f');

figure;
surf(X,Y,(val./counter).' - Z);
xlabel('x');
ylabel('y');
zlabel('f');
zlim([-0.5 0.5]);







