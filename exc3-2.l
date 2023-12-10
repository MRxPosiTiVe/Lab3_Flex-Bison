%{
#include "exc3-2.tab.h"
%}

%%

[0-9]+ { yylval = atoi(yytext); return NUMBER; }
[-+\n] { return yytext[0]; }
.

%%