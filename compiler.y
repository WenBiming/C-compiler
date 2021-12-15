%{
#include <stdio.h>
int yylex();
int yyerror(char *s);
%}
%token IDENTIFIER CONSTANT
%token IF ELSE WHILE FOR RETURN
%token ADD_ASSIGN SUB_ASSIGN MUL_ASSIGN DIV_ASSIGN MOD_ASSIGN


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

void yyerror(char const *s)
{
	fflush(stdout);
	printf("\n%*s\n%*s\n", column, "^", column, s);
}
