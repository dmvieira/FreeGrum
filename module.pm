#!/usr/bin/perl
use 5.12.1;
use warnings;
use strict;

package IdentSystem;

sub le {

	my $modulo = shift;
	my $titulo = shift;
	my $local = shift;
	my $linha = 0;
	open (my $arquivo, "<".$local."/".$titulo."_".$modulo.".fgm") or die "Não foi possível abrir o $titulo:$!";
    while (<$arquivo>) {
        if ($linha == 0) { $linha++;}
        else { print "$_ \n"; }
    }
	close($arquivo);
	<>;
	Interface::mostra_principal($titulo);	

}
sub escreve {
	my $modulo = shift;
	my $titulo = shift;
	my $local = shift;
	open (my $arquivo, ">".$local."/".$titulo."_".$modulo.".fgm") or die "Não foi possível abrir o $titulo:$!";
	print $arquivo ">>>".$modulo."<<< \n Comece a editar aqui!";
	close($arquivo);
	system "vi ".$local."/".$titulo."_".$modulo.".fgm";
	Interface::mostra_principal($titulo);	

}
sub altera {
	my $modulo = shift;
	my $titulo = shift;
	my $local = shift;

	system "vi ".$local."/".$titulo."_".$modulo.".fgm";
	Interface::mostra_principal($titulo);	

}

sub deleta {
	my $modulo = shift;
	my $titulo = shift;
	my $local = shift;

	unlink ($local."/".$titulo."_".$modulo.".fgm");
	Interface::mostra_principal($titulo);	

}

sub trim
{
	my $string = shift;
	$string =~ s/^\s+//;
	$string =~ s/\s+$//;
	return $string;
}
sub str_replace {
	my $replace_this = shift;
	my $with_this  = shift; 
	my $string   = shift;
	my $length = length($string);
	my $target = length($replace_this);
	$string =~ s/$replace_this/$with_this/; 	
	for(my $i=0; $i<$length - $target + 1; $i++) {
		if(substr($string,$i,$target) eq $replace_this) {
			$string = substr($string,0,$i) . $with_this . substr($string,$i+$target);
			return $string; #Comment this if you what a global replace
		}
	}
	return $string;
}

42;
