gcc filename.c or cc filename.c
./a.out


lex filename.l [which creates a c file named lex.yy.c]
gcc lex.yy.c [to compile the generated c file with gcc]
 or
gcc lex.yy.c -ll [for linking libraries]
/a.out
lex filename.l [which creates a c file named lex.yy.c]
yacc -d filename.y or
yacc filename.y [which creates y.tab.c file]
gcc lex.yy.c y.tab.c -ll -ly [to compile the generated c files with 
./a.out
