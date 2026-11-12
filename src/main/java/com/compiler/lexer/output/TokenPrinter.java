package com.compiler.lexer.output;

import com.compiler.lexer.generated.JavaScriptLexer;
import org.antlr.v4.runtime.CommonTokenStream;
import org.antlr.v4.runtime.Token;

public class TokenPrinter {

    // Order: line:column  (same order as LexicalErrorListener)
    private static final String TOKEN_FORMAT = "Text: [%s] -> Type: %s (%d:%d)";

    public static void printTokens(CommonTokenStream tokens) {
        System.out.println("--- Tokens Found ---");

        for (Token token : tokens.getTokens()) {
            if (token.getType() == Token.EOF) continue;
            if (isErrorToken(token.getType())) continue;   // reported in the errors section

            // Comments are on the HIDDEN channel but must still be listed.
            String type = JavaScriptLexer.VOCABULARY.getSymbolicName(token.getType());
            String text = token.getText()
                    .replace("\r", "\\r")
                    .replace("\n", "\\n")
                    .replace("\t", "\\t");

            System.out.println(String.format(TOKEN_FORMAT, text, type,
                    token.getLine(), token.getCharPositionInLine() + 1));
        }
    }

    private static boolean isErrorToken(int type) {
        return type == JavaScriptLexer.ERROR_CHAR
                || type == JavaScriptLexer.INVALID_NUMBER
                || type == JavaScriptLexer.UNCLOSED_DOUBLE_STRING
                || type == JavaScriptLexer.UNCLOSED_SINGLE_STRING
                || type == JavaScriptLexer.UNCLOSED_TEMPLATE
                || type == JavaScriptLexer.UNCLOSED_COMMENT;
    }
}