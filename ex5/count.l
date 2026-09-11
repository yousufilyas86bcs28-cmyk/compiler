%{
#include <stdio.h>

int words = 0;
int numbers = 0;
int characters = 0;
%}

%%

[0-9]+      { numbers++; }
[a-zA-Z]+   { words++; }
.           { characters++; }

%%

int yywrap()
{
    return 1;
}

int main()
{
    printf("Enter the input:\n");
    yylex();

    printf("Words = %d\n", words);
    printf("Numbers = %d\n", numbers);
    printf("Characters = %d\n", characters);

    return 0;
}
