#!/usr/bin/perl
use 5.12.1;
use warnings;
use strict;

use module;
use interface;

#IdentSystem::escreve('laricá','Historico','Trabalho1','sistema');
#IdentSystem::le('Historico','Trabalho1','sistema');
#IdentSystem::altera('Historico','Trabalho1','sistema');
say "Diga o nome do trabalho que vai iniciar:";
my $trabalho = <>;
$trabalho = IdentSystem::str_replace('_','-',$trabalho);
$trabalho = IdentSystem::str_replace(' ','-',$trabalho);
my $parte = Interface::mostra_principal(IdentSystem::trim($trabalho));


