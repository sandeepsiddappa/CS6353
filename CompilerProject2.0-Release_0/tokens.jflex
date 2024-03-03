import java_cup.runtime.*;

%%

%class Lexer
%cup
%line
%column

%{
  private Symbol symbol(int type) {
    return new Symbol(type, yyline, yycolumn);
  }

  private Symbol symbol(int type, Object value) {
    return new Symbol(type, yyline, yycolumn, value);
  }
%}

DIGIT = [0-9]
LETTER = [a-zA-Z]
//SYMBOL = [!@#$%\^&\*\(\)\+\-=\{\}\[\]\|\`\~\,\.<>\/\:\;]
SYMBOL = [^{LETTER}{DIGIT}\n\r']
ID = {LETTER}({LETTER}|{DIGIT})*
WS = [ \t\r\n\f]+
//ML_COMMENT = \\\*([^\*]|.|\n|\r)*\*\\  // Multi-line comments
//ML_COMMENT = \\\*[.\n\r[^\*\\]]*\*\\
ML_COMMENT = \\\*([^*]|[*][^\\])*\*\\



CHARLIT = \'(\\[\'\\tnrbfs]|[^\\'\n\r])\'  // Character literals with support for escape sequences
//CHARLIT = \'({LETTER}|{DIGIT}|\\\\|(\\\')|(\\(n|r|t|b|f|s))|\s|{SYMBOL}|\")\'
FLOATLIT = {DIGIT}+"\."{DIGIT}+  // Floating-point literals
STRLIT = STRLIT = \"(\\[nrtbf\"\\]|[^\\\"\n\r\t])*\" 
//STRLIT = "\""[ {LETTER}{DIGIT}(\\\\)(\\\')(\\(n|r|t|b|f|s)){SYMBOL}(\\\")]*"\""
SL_COMMENT = \\\\.* // Adjusted for comments starting with two backslashes
%%

// Keywords and tokens
"class"       { return symbol(sym.CLASS , yytext()); }
"final"       { return symbol(sym.FINAL, yytext()); }
"void"        { return symbol(sym.VOID, yytext()); }
"int"         { return symbol(sym.INT_TYPE, yytext()); }
"char"        { return symbol(sym.CHAR_TYPE, yytext()); }
"bool"        { return symbol(sym.BOOL_TYPE, yytext()); }
"float"       { return symbol(sym.FLOAT_TYPE, yytext()); }
"if"          { return symbol(sym.IF, yytext()); }
"else"        { return symbol(sym.ELSE, yytext()); }
"while"       { return symbol(sym.WHILE, yytext()); }
"read"        { return symbol(sym.READ, yytext()); }
"print"       { return symbol(sym.PRINT, yytext()); }
"printline"   { return symbol(sym.PRINTLINE, yytext()); }
"return"      { return symbol(sym.RETURN, yytext()); }
"true"      { return symbol(sym.TRUE, yytext()); }
"false"      { return symbol(sym.FALSE, yytext()); }

// Identifiers, Literals, and Special Characters
{FLOATLIT}    { return symbol(sym.FLOATLIT, Float.parseFloat(yytext())); }
{DIGIT}+      { return symbol(sym.INTLIT, yytext()); }
{CHARLIT}     { return symbol(sym.CHARLIT, yytext()); }
{STRLIT}      { return symbol(sym.STRLIT, yytext()); }
{WS}          { /* Ignore whitespace. */ }
{SL_COMMENT}  { return symbol(sym.SL_COMMENT, yytext()); }
{ML_COMMENT}  { return symbol(sym.ML_COMMENT, yytext()); }

// Operators and Delimiters
"<="           { return symbol(sym.LESSEQUAL, yytext()); }
">="           { return symbol(sym.GREATEREQUAL, yytext()); }
"&&"           { return symbol(sym.LOGICAL_AND, yytext()); }
"||"           { return symbol(sym.LOGICAL_OR, yytext()); }
"++"           { return symbol(sym.INCREMENT, yytext()); }
"--"           { return symbol(sym.DECREMENT, yytext()); }
"<>"           { return symbol(sym.NOTEQUAL, yytext()); }
"=="           { return symbol(sym.ASSIGN, yytext()); }
"+"           { return symbol(sym.PLUS, yytext()); }
"-"           { return symbol(sym.MINUS, yytext()); }
"*"           { return symbol(sym.TIMES, yytext()); }
"/"           { return symbol(sym.DIVIDE, yytext()); }
"="           { return symbol(sym.EQUAL, yytext()); }
";"           { return symbol(sym.SEMI, yytext()); }
","           { return symbol(sym.COMMA, yytext()); }
"("           { return symbol(sym.LPAREN, yytext()); }
")"           { return symbol(sym.RPAREN, yytext()); }
"{"           { return symbol(sym.LBRACE, yytext()); }
"}"           { return symbol(sym.RBRACE, yytext()); }
"["           { return symbol(sym.LBRACKET, yytext()); }
"]"           { return symbol(sym.RBRACKET, yytext()); }
"?"           { return symbol(sym.QUESTIONMARK, yytext()); }
"~"           { return symbol(sym.NOT, yytext()); }
"<"           { return symbol(sym.LESS, yytext()); }
">"           { return symbol(sym.GREATER, yytext()); }
":"           { return symbol(sym.COLON, yytext()); }
{ID}          { return symbol(sym.ID, yytext()); }

// Error handling for unmatched input
.             { System.err.println("Illegal char '" + yytext() + "' at line " + (yyline ) + ", column " + (yycolumn )); }
