lexer grammar JavaScriptLexer;

VAR      : 'var' ;
LET      : 'let' ;
CONST    : 'const' ;
IF       : 'if' ;
ELSE     : 'else' ;
FOR      : 'for' ;
WHILE    : 'while' ;
FUNCTION : 'function' ;
RETURN   : 'return' ;

INTEGER  : [0-9]+ ;

IDENTIFIER : [a-zA-Z_$][a-zA-Z0-9_$]* ;

ASSIGN : '=' ;
SEMI   : ';' ;

WS : [ \t\r\n]+ -> skip ;
