test:	compiler.l compiler.y
			bison -vdty compiler.y
			flex compiler.l
			gcc -o compiler y.tab.c lex.yy.c 