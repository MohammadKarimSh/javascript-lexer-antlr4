lexer grammar JavaScriptLexer;

// ===================== Reserved Keywords =====================
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

// ===================== Variable declarations =====================
VAR        : 'var' ;
LET        : 'let' ;
CONST      : 'const' ;

// ===================== Boolean / null =====================
BOOLEAN_LITERAL : 'true' | 'false' ;
NULL_LITERAL    : 'null' ;

// ===================== Identifiers =====================
IDENTIFIER : IdentifierStart IdentifierPart* ;

fragment IdentifierStart : [a-zA-Z_$] ;
fragment IdentifierPart  : [a-zA-Z_$0-9] ;
