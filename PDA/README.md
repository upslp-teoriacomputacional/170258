## Datos personales

 - Sebastián Mata Hernández	170258
 - Teoría Computacional
 - Juan Carlos González Ibarra
 - Ingeniería en Tecnologías de la información
 - Universidad Politécnica de San Luis Potosí

 
## Objetivos
Generar un autómata de pila que valide la expresión ab* a partir del AFD creado anteriormente

## Solucion
Haciendo uso de una pila se evalúa la expresión ab* con el mismo código generado de un AFD, que 
básicamente hace lo mismo que dicho AFD pero almacenando los caracteres en una pila para, 
posteriormente evaluarlos.

Este autómata valida n cantidades de 'a' con n cantidades de 'b', haciendo uso también 
de una tabla de transiciones.

## Validando si cada uno de los caracteres son una 'a' o una 'b'
```perl
sub character
{
	$symbol = "";
	$end = "";
	my ($caracter) = @_;	
	if($_[0] =~/a/)
    {	
		$symbol = "a";
		$aux++;
		return 0;
	}else
    {
		if($_[0]=~/b/)
        {
            $symbol = "b";
            pop @pile;
            $aux2++;
            return 1;
		}else
        {
            $symbol = "Invalido";
            return 2;
            exit();
		}
	}
	
}
```

## Uso de la tabla de transiciones
```perl
my @table= ( [0, 1, 2], [1, 2, 2], [2, 2, 2] );
print("\n|  Edo. actual	|Caracter| Simbolo 	| Edo. sig.   | ");
print("\n|	",$status,"       |Epsilon |              |  ",$status,  |");
print("\n|       ",$statusig,"      | ",$char,"     | ",$symbol,"		|  ",$status,"         |");
bot();
```

## Mediante los contadores auxiliares se asegura de que la cadena sea válida
```perl
if($aux != $aux2)
{
	print("\n|	",$status,"       |        |Fin de Cadena |            |");
    bot();

    print("\n|                Cadena Invalida :(                  |\n+----------------------------------------------------+");
}


if(($status == 1 or $status == 2 or $status == 0) and $aux == $aux2)
{
    print("\n|	",$status,"       |        |Fin de Cadena |            |");
    bot();

    print("\n|                Cadena Valida :D                    |\n+----------------------------------------------------+");
}
```
