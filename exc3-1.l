%{
#include <stdio.h>
%}


%%

[0-9]+      { printf("INTEGER\n"); }
[+-]?[0-9]+\.[0-9]+ {printf("DOUBLE\n"); }
[a-zA-Z]+           { printf("STRING\n"); }
"+"         { printf("PLUS\n"); }
"-"         { printf("MINUS\n"); }
"*"         { printf("MULTIPLY\n"); }
"/"         { printf("DEVIDE\n"); }
"("         { printf("LBRAKE\n"); }
")"         { printf("RBRAKE\n"); }
.           { printf("UNKNOWNSYMB\n"); }

%%


int main() {
    yylex();
    return 0;
}
