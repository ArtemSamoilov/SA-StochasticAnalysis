%% Task 11

%% Subtask 1
clc;
clear;

% in time
figure
func_service(100, 0.07);
 
% equilibrium
figure
func_service(100, 0.1);

% queue grows
figure
func_service(100, 0.15); 

%% Subtask 2
clear;
func_ber(1000, 10);

%% Subtask 3
clear;
N = 1000;
lambda  = 0.1;
x_m = 1;
k = 2;
W0 = 300;

% stinks
figure
c = 0.15;
func_insurance(lambda, x_m, k, c, W0, N);

% balance
figure
c = 0.2;
func_insurance(lambda, x_m, k, c, W0, N);

% stonks
figure
c = 0.25;
func_insurance(lambda, x_m, k, c, W0, N);





