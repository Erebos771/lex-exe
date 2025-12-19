%{
#include <stdio.h>
#include <stdlib.h>

int line = 1;
%}

/* Do not require yywrap() */
%option noyywrap

%%

\n                              { line++; }

[ \t\r]+                        { /* skip empty spaces */ }

"int"|"float"|"char"|"if"|"else"|"return"|"for"|"while"|"void"|"main"|"include"   { printf("%-5d %-12s %-15s\n", line, yytext, "Keyword"); }

"=="|"!="|">="|"<="|">"|"<"|"&&"|"||"                                   { printf("%-5d %-12s %-15s\n", line, yytext, "Logical Op"); }

"+"|"-"|"*"|"/"|"="|"++"|"--"                                           { printf("%-5d %-12s %-15s\n", line, yytext, "Arith/Assign Op"); }


[0-9]+"."[0-9]+                  { printf("%-5d %-12s %-15s\n", line, yytext, "Float Const"); }

[0-9]+[a-zA-Z_][a-zA-Z0-9_]*    { printf("%-5d %-12s %-15s\n", line, yytext, "Lexical Error"); }

[0-9]+                          { printf("%-5d %-12s %-15s\n", line, yytext, "Int Const"); }


\"([^\\"]|\\.)*\"               { printf("%-5d %-12s %-15s\n", line, yytext, "String Literal"); }


[a-zA-Z_][a-zA-Z0-9_]*          { printf("%-5d %-12s %-15s\n", line, yytext, "Identifier"); }


";"|"("|")"|"{"|"}"          { printf("%-5d %-12s %-15s\n", line, yytext, "Delimiter"); }
                           

.                             { printf("%-5d %-12s %-15s\n", line, yytext, "Symbol"); }

%%

int main() {
    char filename[100];

    printf("Enter C file name: ");
    scanf("%s", filename);

    yyin = fopen(filename, "r");
    if (!yyin) {
        perror("File open error");
        return 1;
    }

    printf("\nLine  Lexeme       Token Type\n");
    printf("----------------------------------------\n");

    yylex();

    fclose(yyin);
    return 0;
}
