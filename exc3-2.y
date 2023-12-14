%{
#include <stdio.h>

// Объявления функций для лексического и синтаксического анализа
int yylex();
int yyparse();
void yyerror(const char *s);

%}

%token NUMBER

%%

// Правила синтаксического анализа
expr: expr '\n' { printf("Результат: %d\n", $1); return 0;}
          | expr '+' term   { $$ = $1 + $3; }
          | expr '-' term   { $$ = $1 - $3; }
          | term            { $$ = $1; }
          ;

term: NUMBER { $$ = $1; };

%%

// Объявление функции лексического анализатора
int yylex();

// Функция main
int main() {

    // Вызов синтаксического анализатора
    yyparse();
    return 0;
}

// Функция для обработки ошибок
void yyerror(const char *s) {
    fprintf(stderr, "Error: %s\n", s);
}
