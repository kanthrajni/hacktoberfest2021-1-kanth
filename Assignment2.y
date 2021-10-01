%{
#include<stdio.h>
#include<stdlib.h>
int yyerror(char*);
int yylex();
int in=0;
%}
%token A B C D NEWLINE
%%
stmt: S NEWLINE {
return 1;
 }
 ;
S: X Y
 ;

X: A X B
 |
 ;
Y: C Y D
 |
 ;
%%
extern FILE *yyin;
void main()
{
printf("Enter the string to be checked.\n");
do
{
yyparse();
}
while(!feof(yyin));
if(in==1)
	printf("Valid String!!\n");
else
	printf("Invalid String!!\n");
}
int yyerror(char* str)
{
in++;
return 1;
}
