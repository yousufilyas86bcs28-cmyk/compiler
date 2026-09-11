%{
#include <stdio.h>
#include <stdlib.h>

int yylex();
void yyerror(char *s);
%}

%token NUMBER

%%

input:
      /* empty */
    | input line
    ;

line:
      '\n'
    | expr '\n'    { printf("Result = %d\n", $1); }
    ;

expr:
      NUMBER              { $$ = $1; }
    | expr '+' expr       { $$ = $1 + $3; }
    | expr '-' expr       { $$ = $1 - $3; }
    | expr '*' expr       { $$ = $1 * $3; }
    | expr '/' expr       { 
                            if ($3 == 0)
                                yyerror("Division by zero");
                            else
                                $$ = $1 / $3;
                          }
    | '(' expr ')'        { $$ = $2; }
    ;

%%

void yyerror(char *s)
{
    printf("Error: %s\n", s);
}

int main()
{
    printf("Enter expressions:\n");
    yyparse();
    return 0;
}
