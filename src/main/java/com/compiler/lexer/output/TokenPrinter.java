package com.compiler.lexer.output;

import com.compiler.lexer.generated.JavaScriptLexer;
import org.antlr.v4.runtime.CommonTokenStream;
import org.antlr.v4.runtime.Token;

public class TokenPrinter {

    public static void printTokens(CommonTokenStream tokens) {

        JavaScriptLexer lexer =
                (JavaScriptLexer) tokens.getTokenSource();

        System.out.println("\n========== TOKENS ==========");

        System.out.printf(
                "%-20s %-25s %-10s %-10s%n",
                "TOKEN TYPE",
                "LEXEME",
                "LINE",
                "COLUMN"
        );

        System.out.println(
                "----------------------------------------------------------------"
        );

        int tokenCount = 0;

        for (Token token : tokens.getTokens()) {

            if (token.getType() == Token.EOF) {
                continue;
            }

            String tokenType = lexer.getVocabulary()
                    .getSymbolicName(token.getType());

            if (tokenType == null) {
                tokenType = lexer.getVocabulary()
                        .getDisplayName(token.getType());
            }

            System.out.printf(
                    "%-20s %-25s %-10d %-10d%n",
                    tokenType,
                    token.getText(),
                    token.getLine(),
                    token.getCharPositionInLine() + 1
            );

            tokenCount++;
        }

        System.out.println(
                "----------------------------------------------------------------"
        );

        System.out.println("Total Tokens: " + tokenCount);
    }
}