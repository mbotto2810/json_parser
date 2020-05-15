
%{
#include <stdlib.h>
void yyerror(char *);

#include "y.tab.h"

%}


%%

[{] {return '{';}
[}] {return '}';}
["] {return '"';}
[:] {return ':';}
[0-9]+[.]?[0-9]* {return NUM;}
[a-zA-Z0-9]+[ ]*[a-zA-Z0-9]+ {return NUMSTR;}
[\n] ;
[,] {return ',';}
\[ {return '[';}
\] {return ']';}
. ;

%%

int yywrap() {
  return 1;
}
