lexer grammar JavaScriptLexer;

// ===================== 1. Whitespace & Comments =====================
WS                     : [ \t\r\n]+ -> skip ;
HASHBANG_COMMENT       : {getCharIndex() == 0}? '#!' ~[\r\n]* ;
SINGLE_LINE_COMMENT    : '//' ~[\r\n]* ;
MULTI_LINE_COMMENT     : '/*' .*? '*/' ;
HTML_COMMENT           : '<!--' ~[\r\n]* ;

// ===================== 2. Reserved Keywords =====================
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

// Variable declarations
VAR        : 'var' ;
LET        : 'let' ;
CONST      : 'const' ;

// Boolean / null
BOOLEAN_LITERAL : 'true' | 'false' ;
NULL_LITERAL    : 'null' ;

// ===================== 3. Identifiers (المعرفات) =====================
IDENTIFIER : IdentifierStart IdentifierPart* ;

fragment IdentifierStart : [a-zA-Z_$] ;
fragment IdentifierPart  : [a-zA-Z_$0-9] ;

// ===================== 4. String Literals =====================
// تم إصلاح الأسطر المقطوعة وإعادة النجمة المفقودة لكل القواعد
STRING
    : '"'  StrDoubleChar* '"'
    | '\'' StrSingleChar* '\''
    ;

fragment StrDoubleChar       : ~["\\\r\n] | StrLineContinuation | StrEscape ;
fragment StrSingleChar       : ~['\\\r\n] | StrLineContinuation | StrEscape ;
fragment StrEscape           : '\\' ~[\r\nxu]
                             | '\\x' StrHex StrHex
                             | '\\u' StrHex StrHex StrHex StrHex
                             | '\\u{' StrHex+ '}' ;
fragment StrHex              : [0-9a-fA-F] ;
fragment StrLineContinuation : '\\' '\r'? '\n' ;

TEMPLATE_STRING   : Template ;

fragment Template      : '`' TemplatePart* '`' ;
fragment TemplatePart  : '\\' . | TemplateSubst | ~[`\\$] | '$' ;
fragment TemplateSubst : '${' SubstPart* '}' ;
fragment SubstPart
    : Template
    | '{' SubstPart* '}'
    | '"'  StrDoubleChar* '"'
    | '\'' StrSingleChar* '\''
    | '/*' .*? '*/'
    | '//' ~[\r\n]*
    | ~[{}`'"]
    ;

// ===================== 5. Numbers =====================
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

// ===================== 6. Operators & Misc =====================
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