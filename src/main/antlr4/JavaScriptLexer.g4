lexer grammar JavaScriptLexer;

// ---------- Numbers ----------
BIGINT
    : ( DEC_INT | HEX_BODY | OCT_BODY | BIN_BODY ) 'n'
    ;

HEX_NUMBER    : HEX_BODY ;
OCTAL_NUMBER  : OCT_BODY ;
BINARY_NUMBER : BIN_BODY ;

FLOAT
    : DEC_INT '.' DEC_DIGITS? EXPONENT?
    | '.' DEC_DIGITS EXPONENT?
    | DEC_INT EXPONENT
    ;

INTEGER : DEC_INT ;

fragment DEC_INT    : '0' | [1-9] ( '_'? DEC_DIGITS )? ;
fragment DEC_DIGITS : [0-9] ( '_'? [0-9] )* ;
fragment EXPONENT   : [eE] [+-]? DEC_DIGITS ;
fragment HEX_BODY   : '0' [xX] HEX_DIGIT ( '_'? HEX_DIGIT )* ;
fragment OCT_BODY   : '0' [oO] [0-7] ( '_'? [0-7] )* ;
fragment BIN_BODY   : '0' [bB] [01] ( '_'? [01] )* ;
fragment HEX_DIGIT  : [0-9a-fA-F] ;
// ---------- Operators ----------
// Assignment
ASSIGN          : '=' ;
PLUS_ASSIGN     : '+=' ;
MINUS_ASSIGN    : '-=' ;
MUL_ASSIGN      : '*=' ;
DIV_ASSIGN      : '/=' ;
MOD_ASSIGN      : '%=' ;
POW_ASSIGN      : '**=' ;
LSHIFT_ASSIGN   : '<<=' ;
RSHIFT_ASSIGN   : '>>=' ;
URSHIFT_ASSIGN  : '>>>=' ;
AND_ASSIGN      : '&=' ;
OR_ASSIGN       : '|=' ;
XOR_ASSIGN      : '^=' ;
LAND_ASSIGN     : '&&=' ;
LOR_ASSIGN      : '||=' ;
NULLISH_ASSIGN  : '??=' ;

// Comparison
STRICT_EQ       : '===' ;
STRICT_NEQ      : '!==' ;
EQ              : '==' ;
NEQ             : '!=' ;
LE              : '<=' ;
GE              : '>=' ;
LT              : '<' ;
GT              : '>' ;

// Arithmetic
INC             : '++' ;
DEC             : '--' ;
POW             : '**' ;
PLUS            : '+' ;
MINUS           : '-' ;
MUL             : '*' ;
DIV             : '/' ;
MOD             : '%' ;

// Logical / bitwise
AND             : '&&' ;
OR              : '||' ;
NULLISH         : '??' ;
NOT             : '!' ;
BIT_AND         : '&' ;
BIT_OR          : '|' ;
BIT_XOR         : '^' ;
BIT_NOT         : '~' ;
LSHIFT          : '<<' ;
RSHIFT          : '>>' ;
URSHIFT         : '>>>' ;

// Misc
ARROW           : '=>' ;
OPTIONAL_CHAIN  : '?.' ;
QUESTION        : '?' ;
COLON           : ':' ;
ELLIPSIS        : '...' ;
