lexer grammar JavaScriptLexer;

// ================= 1. Reserved Keywords =================
BREAK      : 'break' ;
CASE       : 'case' ;
CATCH      : 'catch' ;
CLASS      : 'class' ;
CONTINUE   : 'continue' ;
DEBUGGER   : 'debugger' ;
DEFAULT    : 'default' ;
DELETE     : 'delete' ;
DO         : 'do' ;
ELSE       : 'else' ;
ENUM       : 'enum' ;
EXPORT     : 'export' ;
EXTENDS    : 'extends' ;
FINALLY    : 'finally' ;
FOR        : 'for' ;
FUNCTION   : 'function' ;
IF         : 'if' ;
IMPORT     : 'import' ;
IN         : 'in' ;
INSTANCEOF : 'instanceof' ;
NEW        : 'new' ;
RETURN     : 'return' ;
SUPER      : 'super' ;
SWITCH     : 'switch' ;
THIS       : 'this' ;
THROW      : 'throw' ;
TRY        : 'try' ;
TYPEOF     : 'typeof' ;
VOID       : 'void' ;
WHILE      : 'while' ;
WITH       : 'with' ;
AWAIT      : 'await' ;
YIELD      : 'yield' ;

// ================= 2. Variable declarations =================
VAR        : 'var' ;
LET        : 'let' ;
CONST      : 'const' ;

// ================= 3. Boolean / null =================
BOOLEAN_LITERAL : 'true' | 'false' ;
NULL_LITERAL    : 'null' ;

// ================= 4. Numbers =================
BIGINT
    : ( DEC_INT | HEX_BODY | OCT_BODY | BIN_BODY ) 'n'
    ;

HEX_NUMBER    : HEX_BODY ;
OCTAL_NUMBER  : OCT_BODY | '0' [0-7]+ ;
BINARY_NUMBER : BIN_BODY ;
INVALID_EXPONENT
    : (DEC_INT '.' DEC_DIGITS? | '.' DEC_DIGITS | DEC_INT)
      [eE] [+-]?
    ;
FLOAT
    : DEC_INT '.' DEC_DIGITS? EXPONENT?
    | '.' DEC_DIGITS EXPONENT?
    | DEC_INT EXPONENT
    ;

INTEGER : DEC_INT ;


INVALID_NUMBER
    : [0-9] [a-zA-Z0-9_]*
    | '.' [0-9] [a-zA-Z0-9_]*
    | [0-9]+ '.' [0-9]+ [a-zA-Z_] [a-zA-Z0-9_]*
    ;

fragment DEC_INT    : '0' | [1-9] ( '_'? [0-9] )* ;
fragment DEC_DIGITS : [0-9] ( '_'? [0-9] )* ;
fragment EXPONENT   : [eE] [+-]? DEC_DIGITS ;
fragment HEX_BODY   : '0' [xX] HEX_DIGIT ( '_'? HEX_DIGIT )* ;
fragment OCT_BODY   : '0' [oO] [0-7] ( '_'? [0-7] )* ;
fragment BIN_BODY   : '0' [bB] [01] ( '_'? [01] )* ;
fragment HEX_DIGIT  : [0-9a-fA-F] ;


// ================= 5. String literals =================

// Valid strings
STRING
    : '"' DQChar* '"'
    | '\'' SQChar* '\''
    ;

// Unclosed strings: stop at an unescaped line terminator or EOF
UNCLOSED_DOUBLE_STRING
    : '"' DQChar* '\\'? LineTerminator
    | '"' DQChar* '\\'? EOF
    ;

UNCLOSED_SINGLE_STRING
    : '\'' SQChar* '\\'? LineTerminator
    | '\'' SQChar* '\\'? EOF
    ;

// Characters allowed inside double-quoted strings
fragment DQChar
    : ~["\\\r\n]
    | '\\' LineTerminator       // Line continuation
    | '\\' ~[\r\n]             // Escape sequence
    ;

// Characters allowed inside single-quoted strings
fragment SQChar
    : ~['\\\r\n]
    | '\\' LineTerminator       // Line continuation
    | '\\' ~[\r\n]             // Escape sequence
    ;

// Supports LF, CRLF and CR
fragment LineTerminator
    : '\r\n'
    | '\r'
    | '\n'
    ;

// ================= 6. Template literals =================
TEMPLATE_STRING
    : Template
    ;

UNCLOSED_TEMPLATE
    : '`' ( '\\' . | ~[`\\] )* EOF
    ;

fragment Template
    : '`' TemplatePart* '`'
    ;

fragment TemplatePart
    : '\\' .
    | TemplateSubst
    | ~[`\\$]
    | '$'
    ;

fragment TemplateSubst
    : '${' SubstPart* '}'
    ;

fragment SubstPart
    : Template
    | '{' SubstPart* '}'
    | '"' DQChar* '"'
    | '\'' SQChar* '\''
    | '/*' .*? '*/'
    | '//' ~[\r\n]*
    | ~[{}`'"]
    ;
// ================= 7. Operators =================
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

// Punctuation
LPAREN          : '(' ;
RPAREN          : ')' ;
LBRACE          : '{' ;
RBRACE          : '}' ;
LBRACKET        : '[' ;
RBRACKET        : ']' ;
SEMICOLON       : ';' ;
COMMA           : ',' ;
DOT             : '.' ;

// ================= 8. Identifiers =================
IDENTIFIER : IdentStart IdentPart* ;

fragment IdentStart : [a-zA-Z_$\p{L}] ;
fragment IdentPart  : [a-zA-Z_$0-9\p{L}\p{N}] ;

// ================= 9. Comments =================

SINGLE_LINE_COMMENT
     : '//' ~[\r\n]* -> channel(HIDDEN)
     ;

 MULTI_LINE_COMMENT
     : '/*' .*? '*/' -> channel(HIDDEN)
     ;

 UNCLOSED_COMMENT
     : '/*' ( ~[*] | '*' ~[/] )* '*'* EOF
     ;

// ================= 10. White space =================
WS : [ \t\r\n\f\u000B\u00A0\uFEFF]+ -> skip ;

// ================= 11. Invalid characters =================
ERROR_CHAR : . ;