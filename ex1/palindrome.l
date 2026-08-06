[24bcs051@mepcolinux compiler]$cat palindrome.l
%{
#include <stdio.h>
#include <string.h>

FILE *fp;
int count = 0;

int ispalindrome(char s[]) {
    int i, j;
    i = 0;
    j = strlen(s) - 1;
    while (i < j) {
        if (s[i] != s[j])
            return 0;
        i++;
        j--;
    }
    return 1;
}

int yywrap(void) {
    return 1;
}
%}

%%
[01]+ {
    int res = ispalindrome(yytext);
    if (res == 1) {
        fprintf(fp, "%s\n", yytext);
        count++;
    }
}

.|\n { /* Ignore any other stray characters and newlines */ }
%%

int main() {
    yyin = fopen("file.txt", "r");
    if (yyin == NULL) {
        printf("Error: Could not open file.txt\n");
        return 1;
    }

    fp = fopen("output.txt", "w");
    if (fp == NULL) {
        printf("Error: Could not create output.txt\n");
        fclose(yyin);
        return 1;
    }

    yylex();

    printf("no of binary palindrome string=%d\n", count);

    fclose(yyin);
    fclose(fp);
    return 0;
}
[24bcs051@mepcolinux compiler]$./palindrome
no of binary palindrome string=2
[24bcs051@mepcolinux compiler]$cat file.txt
101mam
yousuf
11level
[
