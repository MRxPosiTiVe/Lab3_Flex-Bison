%{
#define YYSTYPE double
#include "exc3-3.tab.h"
%}

%%

[0-9]+([.][0-9]+)? { yylval = atof(yytext); return NUMBER; }
[-+*/()\n]                      { return *yytext; }
. 

%%