D			[0-9]
L			[a-zA-Z_]
H			[a-fA-F0-9]

%{
#include "y.tab.h"
#include <stdio.h>
#include <iostream>
void count(void);
void comment();
int check_type();
int column = 0;
%}


%%
"/*"			{ comment();/*注释*/}
"//"[^\n]*      { /* consume //-comment */ }
"int"   {return (INT);}

"break" {printf("%c\n", *yytext);return (BREAK);}     
"continue"  {printf("%c\n", *yytext);return (CONTINUE);}
"else"  {printf("%c\n", *yytext);return (ELSE);}
"for"   {printf("%c\n", *yytext);return (FOR);}
"if"    {printf("%c\n", *yytext);return (IF);}
"return"    {printf("%c\n", *yytext);return (RETURN);}
"while"     {printf("%c\n", *yytext);return (WHILE);}

{L}({L}|{D})*   {printf("%c\n", *yytext);return (IDENTIFIER);}
[1-9]{D}*   {printf("%c\n", *yytext);return (CONSTANT);}

"+="    {printf("%c\n", *yytext);return (ADD_ASSIGN);}
"-="    {printf("%c\n", *yytext);return (SUB_ASSIGN);}
"*="    {printf("%c\n", *yytext);return (MUL_ASSIGN);}
"/="    {printf("%c\n", *yytext);return (DIV_ASSIGN);}
"%="    {printf("%c\n", *yytext);return (MOD_ASSIGN);}

"++"    {printf("%c\n", *yytext);return (INC_OP);}
"--"    {printf("%c\n", *yytext);return (DEC_OP);}
"&&"    {printf("%c\n", *yytext);return (AND_OP);}
"||"    {printf("%c\n", *yytext);return (OR_OP);}
">="    {printf("%c\n", *yytext);return (GE_OP);}
"<="    {printf("%c\n", *yytext);return (LE_OP);}
"=="    {printf("%c\n", *yytext);return (EQ_OP);}
"!="    {printf("%c\n", *yytext);return (NE_OP);}

";"     {printf("%c\n", *yytext);return (';');}
","     {printf("%c\n", *yytext);return (',');}
":"     {printf("%c\n", *yytext);return (':');}
"="     {printf("%c\n", *yytext);return ('=');}
"["     {printf("%c\n", *yytext);return ('[');}
"]"     {printf("%c\n", *yytext);return (']');}
"."     {printf("%c\n", *yytext);return ('.');}
"&"     {printf("%c\n", *yytext);return ('&');}
"!"     {printf("%c\n", *yytext);return ('!');}
"~"     {printf("%c\n", *yytext);return ('~');}
"+"     {printf("%c\n", *yytext);return ('+');}
"-"     {printf("%c\n", *yytext);return ('-');}
"*"     {printf("%c\n", *yytext);return ('*');}
"/"     {printf("%c\n", *yytext);return ('/');}
"%"     {printf("%c\n", *yytext);return ('%');}
"<"     {printf("%c\n", *yytext);return ('<');}
">"     {printf("%c\n", *yytext);return ('>');}
"^"     {printf("%c\n", *yytext);return ('^');}
"|"     {printf("%c\n", *yytext);return ('|');}
"?"     {printf("%c\n", *yytext);return ('?');}
"{"     {printf("%c\n", *yytext);return ('{');}
"}"     {printf("%c\n", *yytext);return ('}');}
"("     {printf("%c\n", *yytext);return ('(');}
")"     {printf("%c\n", *yytext);return (')');}

[\t\v\n\f]      {/*empty*/}
.       {printf('Mystery characters\n');}

%%

int yywrap(void) { 
    return 1;
}

void comment() {
	column = 0;
	char c, prev = 0;
	
	while (cin >> c)      /* (EOF maps to 0) */
	{
		if (c == '/' && prev == '*')
			return;
		prev = c;
	}
	printf("unterminated comment");
}
