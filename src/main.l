
%{
#include <stdlib.h>
void yyerror(char *);

#include "y.tab.h"

%}


%%
["]+[0-9a-zA-Z[:space:]]+["]+ {return STRING;}
[0-9]+[.]+[0-9]+ {return NUMEROD;}
[0-9]+ {return NUMERO;}
[:]+ {return ':';}
[,]+ {return ',';}
[{] {return '{';}
[}] {return '}';}
[\[] {return '[';}
[\]] {return ']';}
[\n]{1,} {return '\n';}
[[:space:]] ;
. ;
%%

int yywrap() {
  return 1;
}
