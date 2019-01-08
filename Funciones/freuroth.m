function f = freuroth(x)
%--------------------------------------------------------------------------
% Proyecto 2 Analisis Aplicado
% Adrian Tame , Alejandro Lemus.
%    142235   ,      148740
%--------------------------------------------------------------------------
% Funcion FREUROTH

n=length(x);            % tamaño del problema 
f = 0;
for i=1:n/2
    f = f +  ( -13 + x(2*i-1) + ( (5-x(2*i) ) .* x(2*i) - 2 ) ...
        .* x(2*i)).^2  + ( -29 + x(2*i-1) + ( ( 1 + x(2*i) ) ...
        .* x(2*i) -14) .* x(2*i)).^2;
        
end