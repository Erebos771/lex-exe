%{ 
#include <stdio.h> 
%} 
%% 
[A-Z][a-z]+" "[A-Z][a-z]+ {printf("Name Valid");} 
"https://"[a-z]+".com" {printf("URL Valid");} 
[0-9]{10} {printf("Mobile Number Valid");} 
[a-z]+"@"[a-z]+.com {printf("Email Valid");} 
[0-9][0-9]"/0"[0-9]"/"[0-9][0-9][0-9][0-9] {printf("Date Valid");} 
[0-9][0-9]"/1"[0-2]"/"[0-9][0-9][0-9][0-9] {printf("Date Valid");} 
"1"[0-2]":"[0-5][0-9]":"[0-5][0-9] {printf("Time Valid");} 
"0"[0-9]":"[0-5][0-9]":"[0-5][0-9] {printf("Time Valid");} 
.* { printf("can be invalid\n"); }        
. {;} 
%% 
int main() { 
printf("Enter an input please : "); 
yylex(); 
return 0; 
} 
int yywrap() { 
return 1; 
} 