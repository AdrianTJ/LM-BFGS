# Método L-BFGS

Adrian Tame, Alejandro Lemus. Las funciones son tomadas de https://www.mat.univie.ac.at/~neum/glopt/test.html#test_unconstr. la funcion de paso esta fuertemente basada en la implementacion de github.com/GuipengLi. 

## Tabla de tiempo computacional (en segundos)

| función, m =   | 3             | 5             | 17            | 29            |
|----------------|---------------|---------------|---------------|---------------|
| Rosenbrock1000 | 1.903362      | 1.836423      | 1.804549      | 1.871539      |
| Tridia         | 2.481546      | 2.545805      | 2.452574      | 2.521204      |
| Dixmaanj       | 38.197323     | 38.716491     | 38.443460     | 38.298658     |
| Freuroth       | 2.293224 (NO) | 2.274541 (NO) | 2.227399 (NO) | 2.375306 (NO) |

Comentarios: Version R2016a Update 7 (9.0.0.960322) de matlab. Procesador 2.8 GHz Intel Core i7.  

## Tabla de resultados de evaluacion

| función, m =   | 3          | 5          | 17         | 29         |
|----------------|------------|------------|------------|------------|
| Rosenbrock1000 | 6.2499e-09 | 6.2497e-09 | 6.2499e-09 | 6.2499e-09 |
| Tridia         | 1.4265     | 0.9787     | 0.6225     | 0.6674     |
| Dixmaanj       | 1.0000     | 1.0000     | 1.0000     | 1.0000     |
| Freuroth       | 2.4492e+04 | 1.1707e+04 | 1.1707e+04 | 2.4515e+04 |

Comentarios: Generada al usar `feval(fname,x)` en $x$, el resultado final del método. 

## Tabla `Tridia` comparacion de resultados de evaluacion con diferentes iteraciones

| iteraciones          | m = 3      | m = 5      | m = 17     | m = 29     |
|----------------------|------------|------------|------------|------------|
| Tridia (iter = 100)  | 1.4625     | 0.9787     | 0.6225     | 0.6674     |
| Tridia (iter = 1000) | 3.1208e-06 | 3.1371e-06 | 3.1292e-06 | 3.1311e-06 |

Comentarios: Generada al usar `feval(fname,x)` en $x$, el resultado final del método. 

## Tabla `Tridia` comparacion de tiempo computacional con diferentes iteraciones

| iteraciones          | m = 3     | m = 5     | m = 17    | m = 29    |
|----------------------|-----------|-----------|-----------|-----------|
| Tridia (iter = 100)  | 2.481546  | 2.545805  | 2.452574  | 2.521204  |
| Tridia (iter = 1000) | 23.718564 | 23.831391 | 24.275515 | 24.178187 |

## Graficas de Convergencia

Nota: Solamente se incluyen los resultados para las distintas funciones en m = 17. 

### Rosenbrock1000

![Rosenbrock1000](https://github.com/AdrianTJ/LM-BFGS/blob/master/ros1000.jpg?raw=true)

### Tridia

![Tridia](https://github.com/AdrianTJ/LM-BFGS/blob/master/tridia.jpg?raw=true)

### Dixmaanj

![Dixmaanj](https://github.com/AdrianTJ/LM-BFGS/blob/master/dixmaanj.jpg?raw=true)

### Freuroth

![Freuroth](https://github.com/AdrianTJ/LM-BFGS/blob/master/freud.jpg?raw=true)
