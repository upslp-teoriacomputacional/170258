#!/usr/bin/perl

# Mata Hernández Sebastián
# 170258
# Profesor: Juan Carlos Gonzáles Ibarra
# Universidad Politécnica de San Luis Potosí
# Descrición: Programa para construir tablas de verdad usando operadores lógicos.

# Para este caso, Perl no cuenta con variables tipo booleanas como tal, en su lugar se usarán números
# así también, en este lenguaje las listas no son una estructura de datos, son expresiones en código
# y son asignados casi siempre a un arreglo en ese caso.

use strict;
use warnings;

my @booleans =(0,1);
# Utilizaremos las variables a y b para facilitar el uso de las mismas
# para las estructuras.
my $a;
my $b;

# Tabla de verdad de OR
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
print("\n\n");

# Tabla de verdad de AND
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
print("\n\n");

# Tabla de verdad de NOT
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
print("\n\n");

# Tabla de verdad de ^ (OR exclusivo o XOR)
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
