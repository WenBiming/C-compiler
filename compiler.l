D			[0-9]
L			[a-zA-Z_]


%option noyywrap nodefault yylineno
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
"int"   {printf("%s\n", yytext);return (INT);}

"break" {printf("%s\n", yytext);return (BREAK);}     
"continue"  {printf("%s\n", yytext);return (CONTINUE);}
"else"  {printf("%s\n", yytext);return (ELSE);}
"for"   {printf("%s\n", yytext);return (FOR);}
"if"    {printf("%s\n", yytext);return (IF);}
"return"    {printf("%s\n", yytext);return (RETURN);}
"while"     {printf("%s\n", yytext);return (WHILE);}

{L}({L}|{D})*   {printf("%s\n", yytext);return (IDENTIFIER);}
[1-9]{D}*   {printf("%s\n", yytext);return (CONSTANT);}

"+="    {printf("%s\n", yytext);return (ADD_ASSIGN);}
"-="    {printf("%s\n", yytext);return (SUB_ASSIGN);}
"*="    {printf("%s\n", yytext);return (MUL_ASSIGN);}
"/="    {printf("%s\n", yytext);return (DIV_ASSIGN);}
"%="    {printf("%s\n", yytext);return (MOD_ASSIGN);}

"++"    {printf("%s\n", yytext);return (INC_OP);}
"--"    {printf("%s\n", yytext);return (DEC_OP);}
"&&"    {printf("%s\n", yytext);return (AND_OP);}
"||"    {printf("%s\n", yytext);return (OR_OP);}
">="    {printf("%s\n", yytext);return (GE_OP);}
"<="    {printf("%s\n", yytext);return (LE_OP);}
"=="    {printf("%s\n", yytext);return (EQ_OP);}
"!="    {printf("%s\n", yytext);return (NE_OP);}

";"     {printf("%s\n", yytext);return (';');}
","     {printf("%s\n", yytext);return (',');}
":"     {printf("%s\n", yytext);return (':');}
"="     {printf("%s\n", yytext);return ('=');}
"["     {printf("%s\n", yytext);return ('[');}
"]"     {printf("%s\n", yytext);return (']');}
"."     {printf("%s\n", yytext);return ('.');}
"&"     {printf("%s\n", yytext);return ('&');}
"!"     {printf("%s\n", yytext);return ('!');}
"~"     {printf("%s\n", yytext);return ('~');}
"+"     {printf("%s\n", yytext);return ('+');}
"-"     {printf("%s\n", yytext);return ('-');}
"*"     {printf("%s\n", yytext);return ('*');}
"/"     {printf("%s\n", yytext);return ('/');}
"%"     {printf("%s\n", yytext);return ('%');}
"<"     {printf("%s\n", yytext);return ('<');}
">"     {printf("%s\n", yytext);return ('>');}
"^"     {printf("%s\n", yytext);return ('^');}
"|"     {printf("%s\n", yytext);return ('|');}
"?"     {printf("%s\n", yytext);return ('?');}
"{"     {printf("%s\n", yytext);return ('{');}
"}"     {printf("%s\n", yytext);return ('}');}
"("     {printf("%s\n", yytext);return ('(');}
")"     {printf("%s\n", yytext);return (')');}

[\t\v\n\f]      {/*empty*/}
.       {printf("Mystery characters\n");}

%%



void comment() {
	column = 0;
	char c, prev = 0;
	
	while (std::cin >> c)      /* (EOF maps to 0) */
	{
		if (c == '/' && prev == '*')
			return;
		prev = c;
	}
	printf("unterminated comment");
}
