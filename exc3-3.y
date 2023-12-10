%{
#include <stdio.h>

// Объявления функций для лексического и синтаксического анализа
int yylex();
int yyparse();
void yyerror(const char *s);
%}

// Объединение для представления числа (тип double)
%union {
    double number;
}

// Токен для представления числа
%token <number> NUMBER

// Определение типов для символов синтаксического анализа
%type <number> factor term expr

%%

// Правила синтаксического анализа
expr: expr '\n' { 
    // Вывод результата выражения при завершении строки
    printf("\nResult: %.2f\n", $1); 
    return 0; 
}  
| term { $$ = $1; } // Основное выражение
| expr '+' term { printf("+ "); $$ = $1 + $3; } // Сложение
| expr '-' term { printf("- "); $$ = $1 - $3; } // Вычитание
;

term: factor { $$ = $1; } // Основной терм
| term '*' factor { printf("* "); $$ = $1 * $3; } // Умножение
| term '/' factor { printf("/ "); $$ = $1 / $3; } // Деление
;

factor: NUMBER { 
    // Вывод числа и присвоение результата
    printf("%.2f ", $1); 
    $$ = $1; 
} 
| '(' expr ')' { $$ = $2; } // Обработка скобок
;

%%

// Объявление функции лексического анализатора
int yylex();

// Функция main
int main() {
    // Вызов синтаксического анализатора
    yyparse();
    return 0;
}

void yyerror(const char *s) {
    fprintf(stderr, "Error: %s\n", s);
}
