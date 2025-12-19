%{

#include<stdio.h>

int count=0 ;
%}  

%option noyywrap

%%
[A-Za-z]+                   {printf("%s Name valid \n",yytext);}

[a-z0-9]+@[a-z.]+           {printf("%s Email valid\n", yytext); count++;}

[6-9][0-9]{9}              {printf("%d Mobile No. valid \n", yytext);}                          /*{min,max} for limits ie.{9} here says minmun 9 no.*/ 

[$*#@!]                    {printf("Special char\n");}

.                          {printf("Everything else \n");}


\n                         {printf("salle \n", yytext); return 0;}
%%

int main(){

printf("ENTER A STRING : ");
yylex();
printf("%d are number of emails",count);
}








