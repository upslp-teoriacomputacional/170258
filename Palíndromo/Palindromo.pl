#!/bin/usr/perl

#----------------------------------------------#
#                                              #
#           Sebastián Mata Hernández           #
#                 170258  ITI                  #
#             Teoría Computacional             #
#          Juan Carlos González Ibarra         #
#  Universidad Politécnica de San Luis Potosí  #
#                                              #
#----------------------------------------------#
use strict;
use warnings;

print "+-------------------------------------+\n";
print "|          Cadena a analizar:         |\n";
print "+-------------------------------------+\n";
my $chain = <STDIN>;

# Eliminar los espacios que llegara a tener la cadena y cambiar todas
# las letras a minúsculas para que sea más fácil la comparación.
$chain =~ s/\s//g;
$chain =~ tr/A-Z/a-z/;
my @palindrome = split //,$chain;

# Validando si la cadena ingresada es un palíndromo
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
if (&palindromo == 1)
{
	print "La cadena $chain es un palindromo :D";
}else
{
	print "La cadena $chain no es un palindromo :(";
}