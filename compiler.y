%{
#include <stdio.h>
int yylex();
int yyerror(char *s){};
%}
%token IDENTIFIER CONSTANT
%token IF ELSE WHILE FOR RETURN


%%
start:   /*empty*/   {/*empty*/}
|   start E '\n'    {/*empty*/}
;

E:  CONSTANT    {printf('CONSTANT');}
|   IDENTIFIER  {printf('IDENTIFIER');}
;
%%

int main(int argc, char **argv)
{
    return yyparse();
}
