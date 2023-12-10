%{
#include <stdio.h>

// Объявления функций для лексического и синтаксического анализа
int yylex();
int yyparse();
void yyerror(const char *s);

// Переменная для хранения результата выражения
int result;
%}

%token NUMBER

%%

// Правила синтаксического анализа
expression: expression '\n' {
    printf("Результат: %d\n", $1);
    result = $1;
} 
          | expression '+' term   { $$ = $1 + $3; }
          | expression '-' term   { $$ = $1 - $3; }
          | term                  { $$ = $1; }
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
