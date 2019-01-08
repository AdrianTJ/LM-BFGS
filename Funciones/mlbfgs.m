function [xt,k] = mlbfgs(fname,x0,m)
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Funcion L-BFGS
% Proyecto 2 Analisis Aplicado
% Adrian Tame , Alejandro Lemus.
%    142235   ,      148740
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%% Inputs
% fname .............................. funcion a minimizar.
% x0    .............................. vector inicial de funcion a minimizar.
% m     ..............................  capacidad de memoria.
%%%%%%%%%%-----------------------------------------------------------------
%%%% Outputs
% xt    .............................. vector final de minimizacion.
%  k    .............................. numero de iteraciones realizadas
%--------------------------------------------------------------------------
% Declaracion de Variables 
%--------------------------------------------------------------------------
tol = 1e-10;                          % Tolerancia del metodo
n = length(x0);
x = x0;
maxiter = 100;                       % Numero maximo de iteraciones a realizar
%--------------------------------------------------------------------------
% Iteracion 0
%--------------------------------------------------------------------------
k = 0;
Sm = zeros(n,m);  % Matriz de almacenamiento de sk =  xk+1 - xk de capacidad m.
Ym = zeros(n,m);  % Matriz de almacenamiento de yk = gradf_k+1 - gradf_k de capacidad m.
%--------------------------------------------------------------------------
% Iteracion 1
%--------------------------------------------------------------------------
fx = feval(fname,x);
gx = gradiente(fname,x);
%----------------------------------------------------------------------
% Busqueda de linea 
p = -gx;
alfa = 1.0;
c1 = 1.e-04;
xt = x + alfa*p; 
fxt = feval(fname,xt);
fx = feval(fname,x);
der = c1*(gx'*p);
maxjter = 8; jter = 0;

% Condicion de wolfe.
while(fxt > fx + alfa*der && jter < maxjter)
   alfa = alfa/2;
   xt = x + alfa*p;
   fxt = feval(fname,xt);
   jter = jter + 1;
end
%----------------------------------------------------------------------
xt = x - alfa*gx;
k =1;
%--------------------------------------------------------------------------
% Paso Iterativo
%--------------------------------------------------------------------------
while(norm(gx) > tol && k < maxiter)
    gxt = gradiente(fname,xt);
    fxt = feval(fname,xt);
    s0 = xt - x;
    y0 = gxt - gx;
    p = zeros(length(gx),1);
    if (k<=m)
        % Actualizacion vectores S, Y
        Sm(:,k) = s0;
        Ym(:,k) = y0;
        
        p = -paso(gxt,Sm(:,1:k),Ym(:,1:k),s0'*y0/(y0'*y0)); 
    elseif (k>m)
        % Caso con capacidad m rebasada, actualizacion de vectores S,Y para respetar memoria.
        Sm(:,1:(m-1))=Sm(:,2:m);
        Ym(:,1:(m-1))=Ym(:,2:m);
        Sm(:,m) = s0;
        Ym(:,m) = y0;    
        
        p = -paso(gxt,Sm,Ym,s0'*y0/(y0'*y0));
    end
    % Busqueda de linea
    alfa = linesearch(fname,fxt,fx,x,gx,p);
    %----------------------------------------------------------------------
      x = xt;
      gx = gxt;
      xt = xt + alfa*p;
      k = k + 1; 
end
end




