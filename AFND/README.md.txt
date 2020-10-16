**Universidad politécnica de San Luis Potosí**

**Alumno:** Sebastián Mata Hernández

**Matricula:** 170258

**Materia:** Teoría Computacional

**Maestro:** Juan Carlos González Ibarra 
 
## Objetivos
	Desarrollar un AFND que valide una entrada de datos en el formato: a*ba*

## Problemas al programar  
	Donde se validaba el fin de la cadena daba error, ya que al leer la cadena, Perl lo hacia con la funcion chomp()
	pero quitaba el salto de linea, por lo tanto, quité el chomp() y validé el final de la cadena de la siguiente manera:
```Perl

 	if ($_[0] eq "\n"){
		return 2;            
	}

```

	Utilizo la función lenght($cadena) para obtener el largo de la cadena

```Perl

 	if (($estado == 3) && ($aux==length($cadena)))

```

## Código Principal del Autómata

```Perl

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

```