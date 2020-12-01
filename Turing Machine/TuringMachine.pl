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

sub turing_m{
    my $pos = $_[5];
    my $status = $_[0];
    my @cinta = ();
    @cinta = $_[2];
    my @rules = $_[4];
    my $space = $_[1];
    my $length = $_[2];

    if(@cinta eq ' '){
        push(@cinta, $space);
    }
    if($pos<0){
        $pos += $length;
    }
    if($pos >= $length || $pos<0){
        print "No se inicializo bien la posicion";
    }

    my $v1 = '';
    my $dr = '';
    my $s1 = '';
    my $s0 = '';
    my $v0 = '';

    while($status != $_[3]){
        print ($status);
        foreach my $n ($length){
            if($n==$pos){
                print "[$n]";
            }
            else{
                print $n;
            }
        }
        print "";

        my %rule = (
            $s0 => $rules[1],
            $v0 => $rules[2],
            $v1 => $rules[3],
            $dr => $rules[4],
            $s1 => $rules[5]);
        
        for (my $x=0; $x<=$length; $x++){
            if($x == $pos){
                $cinta[$x] = $v1;
            }
        }

        if ($dr eq 'L'){
            if($pos>0){
                $pos=$pos-1;
            }
            else{
                unshift(@cinta, 0, $_[1]);
            }
        }

        if($dr eq 'R'){
            $pos = $pos+1;
            if($pos>= $length){
                push(@cinta, $space);
            }
        }
        $status = $s1;
    }
}
my @reglas;
my @cinta;

@reglas = [
            ['0','b','b','R','0'],
            ['0','1','1','R','0'],
            ['0','/','/','R','0'],
            ['0','=','=','L','1'],

            ['1','1','x','L','2'],

            ['2','1','1','L','2'],
            ['2','/','/','L','3'], 

            ['3','B','B','L','3'],
            ['3','■','■','R','9'],
            ['3','1','B','R','4'],

            ['4','x','x','R','4'],
            ['4','B','B','R','4'],
            ['4','/','/','R','11'],
            ['4','=','=','R','5'],
            
            ['5','1','1','R','5'],
            ['5','■','1','L','6'],
            
            ['6','=','=','L','6'], 
            ['6','1','1','L','6'],
            ['6','x','1','L','6'],
            ['6','■','■','R','7'],
            ['6','/','/','L','10'],
            
            ['7','=','=','R','7'], 
            ['7','1','1','R','7'],
            ['7','/','/','R','7'],
            ['7','B','1','R','7'],
            ['7','■','■','R','8'],
            #Estado final (8)
            ['9','/','/','R','9'],
            ['9','1','1','R','9'],
            ['9','x','1','R','9'], 
            ['9','B','1','R','16'],
            ['9','=','=','R','7'],
            
            ['10','B','B','L','10'],
            ['10','1','1','R','0'],
            ['10','■','■','R','7'],
            
            ['11','1','1','R','11'],
            ['11','x','x','L','12'],
            
            ['12','B','B','R','12'],
            ['12','/','/','L','13'],
            ['12','1','x','L','2'],
            
            ['13','B','B','L','13'],
            ['13','1','1','R','14'],
            ['13','■','■','R','15'],
            
            ['14','B','B','R','14'],
            ['14','x','x','R','14'],
            ['14','/','/','R','14'],
            ['14','=','=','R','5'],

            ['15','/','/','R','15'],
            ['15','x','x','R','15'],
            ['15','B','B','R','15'],
            ['15','=','=','R','5'],
            
            ['16','=','=','R','16'], 
            ['16','x','x','R','16'],
            ['16','/','/','R','16'],
            ['16','B','B','R','16'],
            ['16','1','1','R','16'],
            ['16','■','■','R','17'],
            
            ['17','1','1','R','17'],
            ['17','■','1','L','18'],
            
            ['18','■','■','L','18'], 
            ['18','x','x','L','18'],
            ['18','1','1','L','18'],
            ['18','=','=','L','18'],
            ['18','/','/','L','19'],
            
            ['19','B','B','L','19'],
            ['19','1','1','R','23'],
            
            ['20','/','/','R','20'],
            ['20','x','x','R','20'],
            ['20','=','=','R','20'],
            ['20','B','B','R','20'], 
            ['20','1','1','R','20'],
            ['20','■','■','R','21'],
            
            ['21','1','1','R','21'],
            ['21','■','1','L','18'],
            
            ['22','x','1','R','24'],
            ['22','=','=','R','8'],
            
            ['23','/','/','R','22'],
            ['23','B','1','R','20'],
            
            ['24','1','1','R','24'],
            ['24','x','x','R','24'],
            ['24','=','=','R','24'],
            ['24','■','■','R','25'],
            
            ['25','1','1','R','25'],
            ['25','■','■','L','26'],
            
            ['26','1','■','L','27'],
            
            ['27','■','■','L','27'],
            ['27','1','1','L','27'],
            ['27','=','=','L','28'],
            
            ['28','x','x','L','28'],
            ['28','1','1','R','22']
        ];
@cinta = ['1','1','1','/','1','1','='];

print("Maquina de Turing");
&turing_m('0','■',@cinta,'8',@reglas,0)