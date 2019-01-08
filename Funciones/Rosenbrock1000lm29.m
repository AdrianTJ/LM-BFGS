%%%%%-------------Script de ejecucion algoritmo LMBFGS con funcion ROSENBROCK1000 m = 29 -----------------%%%%%
% clear;
% clc;

% Punto Inicial x0 = [5,5,5,...,5] %
% Generacion punto inicial %

x0 = ones(1000,1)*5;

tic
[x,iter] = mlbfgs('Rosenbrock1000',x0,29);
toc

stem(x)

feval('Rosenbrock1000',x)