## Datos personales

 - Sebastián Mata Hernández	170258
 - Teoría Computacional
 - Juan Carlos González Ibarra
 - Ingeniería en Tecnologías de la información
 - Universidad Politécnica de San Luis Potosí

 
## Objetivos
Dada una cadena con espacios o sin espacios, analizar si es, o no, un palíndromo.

## Solucion
Como parte de la solución se buscó copiar la cadena inicial a otra diferente, quitando los espacios y convirtiendo
todos los caracteres a minúsculas para facilitar la comparación de ambas cadenas.

Se copiaron los caracteres de la cadena inicial a un array, posteriormente, utilizando la función "reverse" se
pasó el array de la cadena inicial pero invertido a otro array, para compararlos caracter por caracter y
de esta manera comprobar que la cadena inicial es un palíndromo.

## Quitando los espacios de la cadena ingresada y convirtiendo todos los caracteres de la misma a minúsculas
```Perl
# Eliminar los espacios que llegara a tener la cadena y cambiar todas
# las letras a minúsculas para que sea más fácil la comparación.
$chain =~ s/\s//g;
$chain =~ tr/A-Z/a-z/;
my @palindrome = split //,$chain;
```

## Validando si la cadena ingresada es un palíndromo.

```Perl
sub palindromo
{	
# Se llena otra cadena con el contenido de la cadena inicial
    # pero en orden inverso para compararlas
    my @inv = reverse(@palindrome);
    # Variable auxiliar para recorrer ambas cadenas 
    my $aux = 0;	
    # Analizando cada caracter de las cadena inicial
    for(@palindrome)
    {
	# En caso de que algún caracter no coincida al analizar
        # ambas cadenas, se retornará un 0.
	if ($palindrome[$aux] ne $inv[$aux])
        {
            return 0;
	}

	$aux+=1;
    }
    # Si todos los caracteres de la cadena inicial concuerdan
    # con los caracteres de la cadena que invertimos se
    # retorna un 1.
    return 1;
}
```
## Dependiendo del valor retornado en la anterior subrutina, se imprime si la cadena es, o no, un palíndromo.
```Perl
if (&palindromo == 1)
{
	print "La cadena $chain es un palindromo :D";
}else
{
	print "La cadena $chain no es un palindromo :(";
}
```
 
