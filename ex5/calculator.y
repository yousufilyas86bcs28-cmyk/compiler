%{
#include <stdio.h>
%}

%token NUMBER

%%

expr:
      NUMBER              { printf("Number = %d\n", $1); }
    | expr '+' expr       { printf("Result = %d\n", $1 + $3); }
    | expr '-' expr       { printf("Result = %d\n", $1 - $3); }
    | expr '*' expr       { printf("Result = %d\n", $1 * $3); }
    ;

%%

int yylex()
{
    return 0;
}

void yyerror(char *s)
{
    printf("Error: %s\n", s);
}

int main()
{
    yyparse();
    return 0;
}
