lexer grammar JavaScriptLexer;
// Section 3:

// Comments
HASHBANG_COMMENT       : {getCharIndex() == 0}? '#!' ~[\r\n]* ;
SINGLE_LINE_COMMENT    : '//' ~[\r\n]* ;
MULTI_LINE_COMMENT     : '/*' .*? '*/' ;
HTML_COMMENT           : '<!--' ~[\r\n]* ;

// String literals

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

WS : [ \t\r\n]+ -> skip ;
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
