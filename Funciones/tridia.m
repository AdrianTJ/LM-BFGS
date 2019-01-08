function f = tridia(x)
%--------------------------------------------------------------------------
% Proyecto 2 Analisis Aplicado
% Adrian Tame , Alejandro Lemus.
%    142235   ,      148740
%--------------------------------------------------------------------------
% Funcion TRIDIA

n=length(x);            % tamaÑo del problema 
alfa = 2;               % Unico parametro que usaremos; los demas son 1   

for i=1:n
	if i == 1
		f = (x(i)-1)^2; % para la primera iteracion es distina la funcion
	else
		f = f + i*((alfa*x(i)-x(i-1)))^2; % para las dem�s la calculamos asi.
	end	
end


