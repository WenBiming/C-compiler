%{
#include <stdio.h>
# include <stdarg.h>
int yylex();
void yyerror(char *s, ...);
extern int yylineno;
%}
%token INT
%token IDENTIFIER CONSTANT
%token IF ELSE WHILE FOR RETURN BREAK CONTINUE
%token ADD_ASSIGN SUB_ASSIGN MUL_ASSIGN DIV_ASSIGN MOD_ASSIGN
%token INC_OP DEC_OP AND_OP OR_OP GE_OP LE_OP EQ_OP NE_OP

%%
start:   /*empty*/   {/*empty*/}
|   start E '\n'    {/*empty*/}
;

E:  CONSTANT    {printf("CONSTANT");}
|   IDENTIFIER  {printf("IDENTIFIER");}
;
%%

int main(int argc, char **argv)
{
    return yyparse();
}

void yyerror(char *s, ...)
{
 va_list ap;
 va_start(ap, s);
 fprintf(stderr, "%d: error: ", yylineno);
 vfprintf(stderr, s, ap);
 fprintf(stderr, "\n");
}