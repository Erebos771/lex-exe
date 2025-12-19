%{
    #include <stdio.h>
    #include <string.h>
    int count = 0; 
    int count2 = 0;        
%}

%%

[AaEeIiOoUu] {count++;}
[BCDFGHJKLMNPQRSTVWXYZbcdfghjklmnpqrstvwxyz] {count2++;}
. {return 0;}
\n {return 0;}
%%


int yywrap() {}

int main() {
    printf("input de do bhai :\n");   
    yylex(); 
    if(count>0){        
    printf("No. of vowels mile = %d\n", count);   
    }else if(count2>0){
    printf("No. of Consonents mile = %d\n", count2);
    }
   
}


