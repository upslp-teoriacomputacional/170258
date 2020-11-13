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

# Estas dos variables se usarán como contadores
our $aux=0;
our $aux2=0;
# Es necesario usar variables globales
our @pile =(" ");
our $end = "";
our $status = 0;
our $symbol = "";

sub top
{
	print("\n|  Edo. actual	|Caracter| Simbolo 	| Edo. sig.   | ");
	bot();
}	
sub mid
{
	my ($statusig, $char, $symb, $status) = @_;
	print ("\n|	",$_[0],"	| ",$_[1],"	 | ",$_[2],"		|  ",$_[3],"	     | ",@pile);
	bot();
}
sub bot
{
	print("\n+---------------+--------+--------------+------------+");
}


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

my @table= ( [0, 1, 2], [1, 2, 2], [2, 2, 2] );
my $status = 0;
$symbol="";

print ("+-------------------------------------+\n|    Ingrese una cadena a evaluar:    |\n+-------------------------------------+");
print("\n");

my $chain = <STDIN>;
chomp $chain;

my @array = split //,$chain;
bot();
top();
print("\n|	",$status,"       |Epsilon |              |  ",$status,"	     |");
bot();

# Se representa cuando un la pila se llena o se vacía añadiendo un elemento a la misma
for my $char (@array)
{	
	my $statusig = $status;	
	push(@pile, " | ");

	my $charchar = character($char);	
	$status = $table[$status][$charchar];	

	if($charchar==2)
    {
		print("\n|       ",$statusig,"      | ",$char,"     | ",$symbol,"		|  ",$status,"         |");
		bot();

		print("\n|              Cadena Invalida                       |\n+----------------------------------------------------+");
        exit();
	}

	if($charchar==1)
    {
		pop @pile;
	}

	mid($statusig, $char, $symbol, $status);
}

if($aux != $aux2)
{
	print("\n|	",$status,"       |        |Fin de Cadena |            |");
    bot();

    print("\n|                Cadena Invalida                     |\n+----------------------------------------------------+");
}


if(($status == 1 or $status == 2 or $status == 0) and $aux == $aux2)
{
    print("\n|	",$status,"       |        |Fin de Cadena |            |");
    bot();

    print("\n|                Cadena Valida :D                    |\n+----------------------------------------------------+");
}
