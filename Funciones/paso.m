function Hg = paso(g,S,Y,gamma)
% Funcion que realiza la operacion H*g.
% donde 
%       H es la aproximacion de la inversa de la matriz Hessiana.
%       g es el gradiente de la funcion.
% Input
%   S:    Matriz de memoria vectores 's' (n x k) , tal que S{i}=x{i+1}-x{i}
%   Y:    Matriz de memoria (n x k) , df{i}=df{i+1}-df{i}
%   g:    vector gradiente (n x 1)
%   hdiag: valor de diagonal de Hessiana evaualua en punto inicial. 
% Output
%   Hg    valor aproximado de operaci??n de producto de aproximacion de Hessina y vector gradiente.
% 
% Esta funcion es una subrutina de funcion LMBFGS.m


    [n,k] = size(S);

    for i = 1:k
        rho(i,1) = 1/(Y(:,i)'*S(:,i)); %Creacion y calculo valor rho. 
    end

    q = zeros(n,k+1);
    r = zeros(n,1);
    alpha =zeros(k,1);
    beta = zeros(k,1);

    % Primera iteracion
    q(:,k+1) = g;

    % Primer ciclo
    for i = k:-1:1
        alpha(i) = rho(i)*S(:,i)'*q(:,i+1);
        q(:,i) = q(:,i+1)-alpha(i)*Y(:,i);
    end

    % Producto con matriz hessiana inicial.
    r = gamma*q(:,1);

    % Segundo ciclo.
    for i = 1:k
        beta(i) = rho(i)*Y(:,i)'*r;
        r = r + S(:,i)*(alpha(i)-beta(i));
    end
    % 
    Hg=r;          %Resolucion de sistema para obtener H.
end 