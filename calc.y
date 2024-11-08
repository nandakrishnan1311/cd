%{
    #include <stdio.h>
    int yylex();
    int flag = 0;
    void yyerror(const char *msg);  
%}

%token NUMBER
%left '+' '-'
%left '*' '/' '%'
%left '(' ')'

%%

ArithmeticExpression: E {
    printf("\nResult = %d\n", $$);  
    return 0;
}

E: E '+' E { $$ = $1 + $3; }
 | E '-' E { $$ = $1 - $3; }
 | E '*' E { $$ = $1 * $3; }
 | E '/' E { $$ = $1 / $3; }
 | E '%' E { $$ = $1 % $3; }
 | '(' E ')' { $$ = $2; }
 | NUMBER { $$ = $1; }
 ;

%%

void yyerror(const char *msg) {
    printf("\nEntered arithmetic expression is Invalid\n\n");
    flag = 1;  
}

int main() {
    printf("\nEnter any arithmetic expression which can have operations Addition, Subtraction, Multiplication, Division, Modulus, and Round brackets:\n");
    yyparse();  
    if (flag == 0)  
        printf("\nEntered arithmetic expression is Valid\n\n");
    return 0;
}
