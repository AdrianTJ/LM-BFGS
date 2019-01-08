%%%%%-------------Script de ejecucion algoritmo LMBFGS con funcion TRIDIA m = 17 -----------------%%%%%
% clear;
% clc;

% Punto Inicial x0 = [1,1,1,...,1] %
% Generacion punto inicial %
x0 = ones(1000,1);

tic
[x,iter] = mlbfgs('tridia',x0,17);
toc

stem(x)

feval('tridia',x)