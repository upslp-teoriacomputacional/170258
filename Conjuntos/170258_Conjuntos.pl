#!/usr/bin/perl
#/***********************************************
#  Sebastián Mata Hernández
#  Profesor: Juan Carlos González Ibarra
#  Universidad Politécnica de San Luis Potosí
#************************************************/

use Set::Scalar; 
use strict;
use warnings;

# Definir conjuntos
my $A = Set::Scalar -> new(1,2,3,4,5);
my $B = Set::Scalar -> new(4,5,6,7,8);
my $C = Set::Scalar -> new(1,3,5,7,9);

print("Conjunto A: ", $A, "\n");
print("Conjunto B: ", $B, "\n");
print("Conjunto C: ", $C, "\n");

# Eliminar un elemento del conjunto
sub eliminar()
{
	print("---Eliminar---\n");
	$A -> delete(2);
	print("Conjunto A despues de eliminar (2): ", $A, "\n");
}

# Eliminar todos los elementos de un conjunto
sub vaciar()
{
	print("---Vaciar Conjunto---\n");
	$A -> clear();
	print("Conjunto A despues de eliminar todos sus elementos: ", $A, "\n");
}

# Copiar contenido de un conjunto a otro
sub copiar()
{
	my $A = Set::Scalar -> new(1,2,3,4,5);
	my $B = Set::Scalar -> new(4,5,6,7,8);
	print("---Copiar Conjunto---\n");
	$B = $A->copy();
	print("Copiando conjunto A a conjunto B\n");
	print("Conjunto A: ", $A, "\n");
	print("Conjunto B: ", $B, "\n");
}

# Agregar un elemento a un conjunto
sub agregar()
{
	print("---Agregar elementos---\n");
	$B->insert(9);
	print("Agregando 9 a Conjunto B\n");
	print("Conjunto B: ", $B, "\n");
}

# Operaciones con conjuntos

# Unión
sub union()
{
	my $A = Set::Scalar -> new(1,2,3,4,5);
	print("---Operaciones con Conjuntos---\n");
	print("---Union---\n");	
	print("La union de A y B: ", $A->union($B), "\n");
}

# Intersección
sub interseccion()
{
	my $A = Set::Scalar -> new(1,2,3,4,5);
	print("---Interseccion---\n");
	print("La interseccion de A y B: ", $A->intersection($B), "\n");
}

# Diferencia
sub diferencia()
{
	my $A = Set::Scalar -> new(1,2,3,4,5);
	print("---Diferencia---\n");
	print("La diferencia de A y B: ", $A->difference($B), "\n");
}

# Diferencia simétrica
sub dif_simetrica()
{
	my $A = Set::Scalar -> new(1,2,3,4,5);
	print("---Diferencia Simetrica---\n");
	print("La diferencia simetrica A B: ", $A->symmetric_difference($B), "\n");
	print("La diferencia simetrica B A: ", $B->symmetric_difference($A), "\n");
	print("La diferencia simetrica A C: ", $A->symmetric_difference($C), "\n");
	print("La diferencia simetrica B C: ", $B->symmetric_difference($C), "\n");
}


# Para las operaciones de subconjunto y superconjunto se utilizaron estructuras if
# ya que Perl no arroja un resultado de tipo TRUE o FALSE, de tal modo que con los
# if se puede determinar si la sentencia es correcta o no.

# Subconjunto
sub subconjunto()
{
	print("---Subconjunto---\n");
	if($A->is_subset($B))
	{
		print("A es subconjunto de B\n");
	}else
	{
		print("A no es subconjunto de B\n");
	}
	if($B->is_subset($A))
	{
		print("B es subconjunto de A\n");
	}else
	{
		print("B no es subconjunto de A\n");
	}
}

# Superconjunto
sub superconjunto()
{
	print("---Superconjunto---\n");
	if($A->is_superset($B))
	{
		print("A es superconjunto de B\n");
	}else
	{
		print("A no es superconjunto de B\n");
	}
	if($B->is_superset($A))
	{
		print("B es superconjunto de A\n");
	}else
	{
		print("B no es superconjunto de A\n");
	}
	
}
# Llamadas de funciones
eliminar();
vaciar();
copiar();
agregar();
union();
interseccion();
diferencia();
dif_simetrica();
subconjunto();
superconjunto();
