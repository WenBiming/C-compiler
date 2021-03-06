/* simplest version of calculator */
%{
#include <stdio.h>
int yylex();
int yyerror(char *s);
%}
/* declare tokens */
%start calclist
%token NUMBER
%token ADD SUB MUL DIV ABS
%token EOL
%%
calclist: /*empty*/ {/*empty*/}
 | calclist exp EOL { printf("= %d\n", $2); } 
 ;
exp: factor
 | exp ADD factor { $$ = $1 + $3;printf("result of add: %d\n", $$); }
 | exp SUB factor { $$ = $1 - $3;printf("result of sub: %d\n", $$); }
 ;
factor: term
 | factor MUL term { $$ = $1 * $3;printf("result of mul: %d\n", $$); }
 | factor DIV term { $$ = $1 / $3;printf("result of div: %d\n", $$); }
 ;
term: NUMBER 
 | ABS term { $$ = $2 >= 0? $2 : - $2; }
;
%%
int main(int argc, char **argv)
{
 yyparse();
}
int yyerror(char *s)
{
 fprintf(stderr, "error: %s\n", s);
}