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
my %tokens=();
my @source_code =  split /\s+/, 'int contador = 5;';
my $chain;


foreach $chain (@source_code){
    
    # Verificara si un token es un tipo de dato
    if ($chain =~ m/str|int|bool/)
    {
		$tokens{'DATATYPE'} = $chain;
    # Verifica si es un identificador en caso de que sea solo una palabra
    }elsif($chain =~ m/[a-z]/ or $chain =~ m/[A-Z]/)
    {
		$tokens{'IDENTIFIER'} = $chain;
    # Verifica si es un operador matemático
    }elsif($chain =~ m/[\+\-\/\*\=\%]/)
    {
		$tokens{'OPERATOR'} = $chain;
    # Verifica si es un elemento entero y lo convierte como un número
    }elsif ($chain =~ m/[0-9]/)
    {
		my @cn = $chain;
		if($cn[scalar(@cn)-1] =~ m/;/)
        {
			$tokens{'INTEGER'} = substr $chain,0,-1;
			$tokens{'END STATEMENT'} = ';';
		}else
        {
		   $tokens{'INTEGER'} = $chain;
		}
	}
}

# Da como salida la matriz de tokens
my $valor;
my $llave;

while (($llave, $valor) = each %tokens)
{
	print "$llave => $valor\n";
}

sub variableP{
	# bool<--(str). True: cuando "c" es un nombre de variable
	 my @c = split //,$_[0];

	if(($c[0]=~ m/[A-Z]/) or ($c[0]=~ m/_/))
    {
		# El 1er caracter es una mayúscula o subrayado	
		splice(@c,0,1);		
		while((scalar @c != 0)and($c[0] =~ m/[a-zA-Z0-9]/ or $c[0] =~ m/_/))
        {
			# Mientras haya caracteres en "c" y el primer caracter actual sea alfanumerico, sigue igual		
			# Remueve el primer caracter
            splice(@c,0,1); 
		}
        # Si ya no quedan elementos por verificar, es una variable PROLOG
		if (scalar @c == 0)
        {
            return 1;
		}
	}
	return 0;
} 
