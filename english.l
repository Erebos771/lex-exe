%{ 
#include <stdio.h> 
%} 

%option noyywrap

%% 

"he"|"him"|"himself"|"they"|"his"|"enemy"|"commander"  { printf("%-15s | %-10s |\n", yytext, "Pronoun"); } 

"a"|"an"|"the"   { printf("%-15s | %-10s |\n", yytext, "Article"); } 

"general"|"victory"|"defeat"|"plans"|"situation"|"ground"|"spirit"|"position"|"strength"|"weakness"|"battle"|"advantage"|"exhaustion"|"waste"|"war"|"mastery"|"art"|"enemy"|"outcome"   { printf("%-15s | %-10s |\n", yytext, "Noun"); } 

"rely"|"fight"|"lays"|"studies"|"prepares"|"knows"|"measuring"|"avoids"|"hides"|"creates"|"confuse"|"won"|"begins"|"shaping"|"defeated"|"fights"|"choosing"|"bring"|"avoiding"   { printf("%-15s | %-10s |\n", yytext, "Verb"); } 

"wise"|"careful"|"strong"|"weak"|"thoroughly"|"skillful"|"greatest"|"swift"|"true"|"endless"|"inevitable"   { printf("%-15s | %-10s |\n", yytext, "Adjective"); } 

"blindly"|"already"|"only"|"certain"|"unnecessary"    { printf("%-15s | %-10s |\n", yytext, "Adverb"); } 

[ \t\n]+     ; 
[a-zA-Z]+    {}  

%% 

int main() {   
    char filename[100];
     printf("Enter C file name: ");
    scanf("%s", filename);

    yyin = fopen(filename, "r");     
    if (!yyin) {         
        printf("File not found.\n");         
        return 1; 
    } 
 
    printf("%-15s | %-10s\n", "Word", "Category");     
    printf("-----------------+------------\n"); 
 
    yylex();     
    fclose(yyin);     
    return 0; 
} 
 















