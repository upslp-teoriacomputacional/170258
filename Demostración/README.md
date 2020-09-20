**Universidad politécnica de San Luis Potosí**

**Alumno:** Sebastián Mata Hernández

**Matricula:** 170258

**Materia:** Teoría Computacional

**Maestro:** Juan Carlos González Ibarra 


## Descripción:
	En el siguiente programa se hace uso de las operaciones básicas de bit a bit en Perl.
	Haciendo uso de un arreglo numérico (0,1) y 2 variables enteras en lugar de variables
	booleanas, mediante estructuras if y estructuras de repetición for.

### Operaciones a bit:
#### AND, OR, NOT & XOR


# Como solucionaste el problema
	Debido a que en Perl no hay variables tipo booleanas, se usarán números (0,1) y estructuras
	if para saber cuándo el valor sea 0 o 1 (true or false). 
	De esta manera se obtienen las tablas de verdad realizando condicionales e iteraciones con 
	estructuras for en el arreglo de enteros.


### Tablas de verdad.
	#Definición de Arreglo "booleno" y variables (a y b)

```perl
	my @booleans =(0,1);
	my $a;
	my $b;
```
 
	#Tabla de verdad OR

```perl
	print("Tabla de verdad (OR):");
	print("\n");
	print("| a\t| b\t| a or b|");
	print("\n\n");
	
	for $a (@booleans)
	{
		for $b (@booleans)
    {
			print("| ", $a);
      printf("\t| ");
			print($b);
      print("\t| ");
			print($a or $b);
      print("\t|\n");
      }
	}
```

	#Tabla de verdad AND

```perl
  print("Tabla de verdad (AND):");
	print("\n");
	print("| a\t| b\t| a or b|");
	print("\n\n");
	
	for $a (@booleans)
  {
		for $b (@booleans)
    {
      print("| ", $a);
      print("\t| ");
			print($b);
      print("\t| ");
			print($a and $b);
      print("\t|\n");
      }
	}
```

	#Tabla de verdad NOT

```perl
	print("Tabla de verdad (NOT):");
	print("\n");
	print("| a\t| not a |");
	print("\n\n");
	
	for $a (@booleans)
  {
    print("| ", $a);
    print("\t| ");
    if((not $a)== 0)
    {
      print(0);
    }else
    {
      print(not $a);
    }
    print("\t| \n");
   }
```

	#Tabla de verdad de XOR

```perl
	print("Tabla de verdad (XOR/^):");
	print("\n");
	print("| a\t| b\t| a or b|");
	print("\n\n");
	
	for $a (@booleans)
	{
		for $b (@booleans)
    {
			print("| ", $a);
      print("\t| ");
			print($b);
      print("\t| ");
			print($a ^ $b);
      print("\t|\n");
		}
  }
```


## Problemas y soluciones al programar
	En Perl no existen las variables booleanas, así que se utilizó un arreglo entero 
	con los valores (0,1) que serán tomados como si estas fueran booleanas (true, false) 
	para poder imprimir las tablas de verdad realizando iteraciones y condicionales 
	mediante if's y for's.
