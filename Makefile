test:	compiler.l compiler.y
			bison -vdty compiler.y
			flex compiler.l
			g++ -o compiler y.tab.c lex.yy.c 