#!/usr/bin/perl
use 5.12.1;
use warnings;
use strict;

package Interface;

sub mostra_principal {
my $trabalho = shift;
say "Bem vindo ao FreeGrum!";
say "Escolha o que deseja fazer em $trabalho:\n";
say "0 : Sair";
say "1 : Identificacao do Sistema";
say "2 : Diagnostico Estrategico";

my $escolha = <>;
system("clear");
if (isint($escolha)){
	if($escolha == 0) { print "Obrigado por ter usado FreeGrum!"; exit 0;}
	elsif($escolha == 1) { Interface::mostra_identsys($trabalho); }
	elsif($escolha == 2) { Interface::mostra_diagestrateg($trabalho); }

	else { Interface::mostra_principal($trabalho);}

}
else{
	Interface::mostra_principal($trabalho);	
}
}

sub mostra_identsys {
my $trabalho = shift;

say "Identificacao do sistema de $trabalho:\n";
say "0 : Menu Principal";
say "1 : Historico";
say "2 : Negocio";
say "3 : Missao";
say "4 : Visao";
say "5 : Valores";
say "6 : Politicas";

my $escolha = <>;
system("clear");
if (isint($escolha)){
	if($escolha == 0){ Interface::mostra_principal($trabalho);}
	elsif($escolha == 1){ Interface::mostra_pergunta('Historico','Interface::mostra_identsys($trabalho)','sistema', $trabalho); }
	elsif($escolha == 2){ Interface::mostra_pergunta('Negocio','Interface::mostra_identsys($trabalho)','sistema', $trabalho); }
	elsif($escolha == 3){ Interface::mostra_pergunta('Missao','Interface::mostra_identsys($trabalho)','sistema', $trabalho); }
	elsif($escolha == 4){ Interface::mostra_pergunta('Visao','Interface::mostra_identsys($trabalho)','sistema', $trabalho); }
	elsif($escolha == 5){ Interface::mostra_pergunta('Valores','Interface::mostra_identsys($trabalho)','sistema', $trabalho); }
	elsif($escolha == 6){ Interface::mostra_pergunta('Politicas','Interface::mostra_identsys($trabalho)','sistema', $trabalho); }

	else { Interface::mostra_identsys($trabalho)}

}
else{
	Interface::mostra_identsys($trabalho);	
}
}

sub mostra_diagestrateg {
my $trabalho = shift;

say "Diagnostico Estrategico de $trabalho:\n";
say "0 : Menu Principal";
say "1 : S (pontos fortes)";
say "2 : W (pontos fracos)";
say "3 : O (oportunidades)";
say "4 : T (tendencias)";
my $escolha = <>;
system("clear");
if (isint($escolha)){
	if($escolha == 0){ Interface::mostra_principal($trabalho);}
	elsif($escolha == 1){ Interface::mostra_pergunta('S','Interface::mostra_diagestrateg($trabalho)','diagnostico', $trabalho); }
	elsif($escolha == 2){ Interface::mostra_pergunta('W','Interface::mostra_diagestrateg($trabalho)','diagnostico', $trabalho); }
	elsif($escolha == 3){ Interface::mostra_pergunta('O','Interface::mostra_diagestrateg($trabalho)','diagnostico', $trabalho); }
	elsif($escolha == 4){ Interface::mostra_pergunta('T','Interface::mostra_diagestrateg($trabalho)','diagnostico', $trabalho); }

	else { Interface::mostra_diagestrateg($trabalho)}

}
else{
	Interface::mostra_diagestrateg($trabalho);	
}
}

sub mostra_pergunta {
	my $local = shift;
	my $anterior = shift;
	my $pasta = shift;
	my $trabalho = shift;
say "O que deseja fazer em $local de $trabalho?\n";
say "0 : Menu Principal";
say "1 : Inserir";
say "2 : Alterar";
say "3 : Ver";
say "4 : Deletar";
say "5 : Menu Anterior";

my $escolha = <>;
system("clear");
if (isint($escolha)){
		if($escolha == 1){ IdentSystem::escreve($local,$trabalho,$pasta);}
		elsif($escolha == 2){ IdentSystem::altera($local,$trabalho,$pasta); }
		elsif($escolha == 3){ IdentSystem::le($local,$trabalho,$pasta); }
		elsif($escolha == 4){ IdentSystem::deleta($local,$trabalho,$pasta); }
		elsif($escolha == 5){ eval($anterior); }
		else { Interface::mostra_principal;}

}
else{
	Interface::mostra_pergunta($local,$anterior,$pasta, $trabalho);	
}
}

sub isint{
  my $val = shift;
  return ($val =~ m/^\d+$/);
}

42;
