

%{
#include <stdio.h>
  #include <stdlib.h>
void yyerror(char *c);
int yylex(void);
%}

%token NUMSTR NUM ALFANUM '}' '{'  ',' '"' ':' '[' ']'

%%

S: OBJETO {printf("VALIDO\n");} ;

OBJETO: 
        '{' CONTEUDO '}' {}
       	| '{' '}' {}
	;

CONTEUDO:
    	'"' NUMSTR '"' ':' VALOR {}
   	| CONTEUDO ',' '"' NUMSTR '"' ':' VALOR {}
	;

VETOR:
	'[' ELEMENTOS ']' {}
	| '[' ']' {}
	;

ELEMENTOS:
	NUM {}
	| '"' NUMSTR '"' {}
	| ELEMENTOS ',' ELEMENTOS {}
	| '[' ELEMENTOS ']'
	| '[' ']'
	;
VALOR:
     	NUMSTR {}
	| NUM {}
	| ALFANUM {}
	| OBJETO {}
	| VETOR {}
	| '"' NUMSTR '"' 
	;


%%

void yyerror(char *s) {
	printf("INVALIDO\n");

}

int main() {
  yyparse();
    return 0;

}
