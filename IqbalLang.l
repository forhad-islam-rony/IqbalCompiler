%{
#include <stdio.h>
#include <stdlib.h>

int keyword = 0;
int identifier = 0;
int number = 0;
FILE *outputFile; // Declare the output file pointer here
%}


ASSUME bolilo
EQUAL soman
DUPLICATE abaro
CONDITION obostha
THEN taile
PRINT dekhain
LOOP ghuribar
STOP thamu
RETURN firan
COMMENT faforbazi
PLUS lagajog
MINUS lagabiyog
DIVISION lagavag
MULTIPLY lagagun

IDENTIFIER [a-zA-Z_][a-zA-Z0-9_]*
NUMBER [0-9]+
WHITESPACE [ \t\n]+
%%

{ASSUME}       { keyword++; }
{EQUAL}        { keyword++; }
{COMMENT}      { keyword++; }
{DUPLICATE}    { keyword++; }
{CONDITION}    { keyword++; }
{THEN}         { keyword++; }
{PRINT}        { keyword++; }
{LOOP}         { keyword++; }
{PLUS}         { keyword++; }
{MINUS}        { keyword++; }
{DIVISION}     { keyword++; }
{MULTIPLY}     { keyword++; }
{STOP}         { keyword++; }
{RETURN}       { keyword++; }
{IDENTIFIER}   { identifier++; }
{NUMBER}       { number++; }
{WHITESPACE}   { /* Ignore whitespace */ }

%%

int main() {
    FILE *inputFile = fopen("input.txt", "r");
    if (!inputFile) {
        perror("Error opening input.txt");
        return 1;
    }
    yyin = inputFile;

    outputFile = fopen("output.txt", "w");
    if (!outputFile) {
        perror("Error opening output.txt");
        fclose(inputFile);
        return 1;
    }

    yylex();

    fprintf(outputFile, "Keywords: %d\n", keyword);
    fprintf(outputFile, "Identifiers: %d\n", identifier);
    fprintf(outputFile, "Numbers: %d\n", number);

    fclose(inputFile);
    fclose(outputFile);
    return 0;
}

int yywrap()
{
	return 1;
}