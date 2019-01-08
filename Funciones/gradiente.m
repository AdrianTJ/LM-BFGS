function  [gfx] = gradiente(fname,x)
% Aproximacion del gradiente por diferencias hacia adelante 
% de una funcion  de R^n a R.

% Zeferino Parada
% 18 de enero de 2018

%In
% fname .- cadena con el nombre de la funcion.
% x .- vector columna de dimension n.
% Out
% gfx - vector columna de dimension n, es la aproximacion al
%       gradiente en x.
%------------------------------------------------------

h = 1.e-06;                    % tamaño de paso
fx = feval(fname,x);           % se evalúa la función en el punto
n = length(x);                 % dimensión del vector
gfx = zeros(n,1);              % vector gradiente de salida
xt = x;

for i = 1:n
    xt(i) = xt(i) +h ;          % punto en la dirección i
    fxh = feval(fname,xt);      % evaluación en la dirección i
    gfx(i) = ( fxh - fx)/ h;    % diferencia hacia adelante
    xt(i) = x(i);               % regreso a la copia de x
end


