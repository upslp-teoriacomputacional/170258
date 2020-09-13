# Programa en Perl | Operaciones con conjuntos
  En el programa adjunto se realizan operaciones con conjuntos, como por ejemplo, la unión, diferencia, diferencia simétrica e intersección,
  Durante el desarrollo del programa se notó que había que recurrir a uno de los módulos externos de Perl, Set::Scalar, ya que este nos permite realizar las operaciones correspondientes con conjuntos.
  El módulo Set::Scalar se obtuvo desde la página oficial: https://metacpan.org/pod/Set::Scalar.

## Datos Personales
**Institución:** Universidad Politécnica de San Luis Potosí

**Matrícula:** 170258

**Nombre:** Sebastián Mata Hernández

**Carrera:** Ingeniería en Tecnologías de la Información

**Materia:** Teoría Computacional

**Profesor:** Juan Carlos González Ibarra


## Como solucionaste el problema
Lo primero fue realizar una búsqueda acerca del lenguaje Perl, conocer la sintáxis del mismo. Una vez hecho esto se procedió a instalar el módulo necesario para poder trabajar con conjuntos.
De esta manera, el único impedimento fue conocer las diferentes operaciones que el módulo Set::Scalar nos permite realizar dentro de Perl con conjuntos y aplicarlas para replicar el código requerido en este lenguaje.

### Instalar Set::Scalar:
En mi caso, instalé la versión 5.32.0.1 de Strawberry Perl para Windows (64 bits) desde el sitio oficial de Perl.
Una vez instalado, abriremos el cmd de Perl para poder instalar el módulo Set::Scalar, para esto solo basta con entrar al shell de Perl escribiendo "perl -MCPAN -e shell", posteriormente escribiremos "install Set::Scalar".
Posteriormente solo es esperar a que se instale el módulo y listo, podremos hacer uso de las funciones que este módulo nos ofrece.

#### Uso de conjuntos en Perl:

Declaración de Conjuntos

```perl
my $A = Set::Scalar -> new (3,4,5);
```
Esta línea de código genera un conjunto llamado "A", cuyos elementos son 3, 4 y 5.

Al momento de imprimir un conjunto basta con escribirlo como:
```perl
print($A);
```

Para manipular conjuntos se usan las siguientes instrucciones:

```perl
$A -> delete(2); 

$A -> clear(); 

$A = $B -> copy(); 

$A -> insert(6); 

```
La primera instrucción elimina el elemento "2" del conjunto A.
La segunda instrucción borra todos los elementos del conjunto A.
La tercera instrucción copia el contenido del conjunto B y lo pega en el conjunto A, sobreescribiendo el contenido del mismo.
Y por último, la cuarta instrucción añade un elemento al conjunto A.

#### Operaciones con conjuntos:

Dentro de Perl, varias de las operaciones que podemos utilizar son la diferencia, la deferencia simétrica, la intersección y la unión.
A su vez, podemos saber si un conjunto es sbuconjunto o superconjunto de otro.
Aquí un ejemplo de las distintas operaciones que fueron desarrolladas a lo largo del programa.
```perl
$A -> union($B);

$A -> intersection($B);

$A -> difference($B);

$A -> symmetric_difference($B);

$A -> is_subset($B);

$A -> is_superset($B);

```

Al momento de querer demostrar si un conjunto es subconjunto o superconjunto de otro hubo un problema, ya que en Perl, este tipo de operaciones,
devuelve un valor booleano. Para hacerlo más sencillo de mostrar se usaron estructuras condicionales "if" para imprimir un mensaje dependiendo si los conjuntos era
superconjuntos o subconjuntos (TRUE o FALSE).

### Por último
Para poder mostrar los resultados de las operaciones y corroborar que todas funcionaban en su totalidad se hace una llamada a cada una
de ellas, mostrando en la salida de cada operación, los conjuntos con los que se realizaron dichas operaciones y su resultado.
Ya sea unión, diferencia, diferencia siméttrica o intersección.
