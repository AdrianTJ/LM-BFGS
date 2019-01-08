%%%%%-------------Script de ejecucion algoritmo LMBFGS con funcion FREUROTH m = 5 -----------------%%%%%
% clear;
% clc;

% Punto Inicial x0 = [0.5,-2,0.5,-2,....,0.5,-2] %
% Generacion punto inicial %
x0 = ones(1000,1);
for i = 1:length(x0)
    if mod(i,2) == 1
        x0(i) = 0.5;
    else
        x0(i) = -2;
    end
end

tic
[x,iter] = mlbfgs('freuroth',x0,5);
toc

stem(x)

feval('freuroth',x)