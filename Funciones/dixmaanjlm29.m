%%%%%-------------Script de ejecucion algoritmo LMBFGS con funcion DIXMAANJ m = 29 -----------------%%%%%
% clc;
% clear;

% Punto Inicial x0 = [2,2,2,....,2] %
x0 = ones(1500,1)*2;

tic
[x,iter] = mlbfgs('dixmaanj',x0,29);
toc

stem(x)

feval('dixmaanj',x)