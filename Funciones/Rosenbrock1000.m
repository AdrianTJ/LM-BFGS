function [fx] = Rosenbrock1000(x)

n = length(x);

if (n==1000)
  fx = 0;
  for k = 1:500
      fx = fx + (x(2*k) - x(2*k -1)^2)^2;
      fx = fx +(1 -x(2*k-1))^2;
  end  
else
    disp('La dimension no es correcta')
    fx =[];
end