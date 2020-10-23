#!/bin/usr/perl

# *  Nombre: Sebastián Mata Hernández
# *  Profesor: Juan Carlos González Ibarra
# *  Escuela: Universidad Poliéctinca de San Luis Potosí
 
use strict;
use warnings;


my $simbol = "";


sub caracter {
    $simbol = "";       
    if ($_[0] eq "a"){
        
        return 0;
    }else{
        if($_[0] eq "b"){            
            return 2;
        }else{
            if ($_[0] eq "\n"){
                return 1;            
            }          
        }
        print "Error: El caracter $_[0] no es  valido\n";
        exit();
        
    }       
    
}

sub encabezado {
    print "|  Edo. Actual |Caracter |  Simbolo  |Edo. Siguiente |\n";
    &body;
}

sub contenido{
    print "|     $_[0]        |    $_[1]\t |   $_[2]     |       $_[3]\t     |\n";
    &body;
}

sub body{
    print "+--------------+---------+-----------+---------------+\n";
}
print "+-------------------------------------+\n";
print "|          Cadena a evaluar:          |\n";
print "+-------------------------------------+\n";

# Tabla de transiciones
my $tabla =  [[0,4,1],[2,3,4],[2,3,4]];

my $estado = 0;
my $aux = 0;
my $estados = 0;
my $charc= undef;
my $cadena = <STDIN>;
&body;
&encabezado;

my $character = "";

# Se recorre la cadena mediante un foreach
foreach $character (split //, $cadena)
{
    #print "$char\n";
    $aux += 1;

    # Método para identificar el caracter
   $charc = &caracter($character);
    
    # Guardar el estado del valor obtenido en la tabla
    $estado=$tabla->[$estado][$charc];
    $estadosig = $estado+1;
    if ($charc == 0){
        $simbol = " a";
        if ($estado ==1)
        {
            $estados = 1;
        }   
    }
    if($charc == 1)
    {
        $simbol = " b";
    }     
    if($charc == 2){
        $simbol = "Fin.";
    }
    
    if ($estado == 4)
    {
        print "|     $estados        |    $character\t | ERROR  |\t     $estado\t     |\n";
        &body;
        print "|              Cadena No Valida.                      |";
        print "\n+----------------------------------------------------+\n\n";
        exit();
    }
    
    if (($estado == 3) && ($aux==length($cadena)))
    {
        print "|     $estado        |     \t | Fin cadena|\t\t     |\n";
        &body;
        print "|                Cadena Valida.                       |";
        print "\n+----------------------------------------------------+\n\n";
        exit();
    }
    if ($estado==3)
    {
        $estado=2;
    }
    &contenido($estado,$character,$simbol,$estados);       
}
