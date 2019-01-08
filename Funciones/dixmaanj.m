function f = dixmaanj(x)
%--------------------------------------------------------------------------
% Proyecto 2 An?lisis Aplicado
% Adrian Tame , Alejandro Lemus.
%  142235   ,      148740
%--------------------------------------------------------------------------
% Funci?n DIXMAANJ

n=length(x); 
alfa = 1;
beta = 0.0625;          
gamma = 0.0625;
delta = 0.0625;
k1 = 2;   
k2 = 0;
k3 = 0;
k4 = 2;
m = floor(n/3);

f1 = 0;
f2 = 0;
f3 = 0;
f4 = 0;

for i=1:n
    f1 = f1 + (alfa*x(i)^2)*((i/n)^k1);
end
for i =1:n-1
    f2 = f2 + beta*(x(i)^2)*((x(i+1)+(x(i+1)^2))^2)*(i/n)^k2;
end

for i =1:2*m
    f3 = f3 + gamma*x(i)^2*x(i+m)^4*(i/n)^k3;
end

for i = 1:m
    f4 = f4 + delta*x(i)*x(i+2*m)*(i/n)^k4;
end

f = 1 + f1+f2+f3+f4;
    
