

%{
#include <stdio.h>
#include <stdlib.h>
void yyerror(char *c);
int yylex(void);
%}

%token '{' '}' STRING NUMERO '\n' ':' ',' NUMEROD '[' ']'

%%
G: 
	S '\n' { printf("VALIDO\n");}
	|
	
	;
	
S:
	'{' DEF '}'
	|
	'{' '\n' DEF '\n' '}'
	|
	'{' DEF '\n' '}'
	|
	'{' '\n' DEF '}'
	;
	
DEF:	
	STRING ':' STRING 
	|
	STRING ':' NUMERO 
	|
	STRING ':' NUMEROD
	|
	STRING ':' LISTA
	|
	STRING ':' S
	|
	DEF ',' DEF
	|
	DEF ',' '\n' DEF
	|
	;
	
LISTA:	
	'['']'
	|
	'[' CONTEUDO ']'
	;
	
CONTEUDO:	
	NUMERO
	|
	NUMEROD
	|
	STRING
	|
	LISTA
	|
	CONTEUDO ',' CONTEUDO
	;
%%

void yyerror(char *s) {
	printf("INVALIDO\n");
}

int main() {
  yyparse();
    return 0;

}
