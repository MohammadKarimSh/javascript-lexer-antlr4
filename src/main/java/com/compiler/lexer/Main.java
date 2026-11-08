package com.compiler.lexer;

import com.compiler.lexer.generated.JavaScriptLexer;
import org.antlr.v4.runtime.CharStreams;
import org.antlr.v4.runtime.CommonTokenStream;
import org.antlr.v4.runtime.Token;

public class Main {

    public static void main(String[] args) {

        String source = """
                let age = 20;
                const total = age + 5;
                """;

        JavaScriptLexer lexer =
                new JavaScriptLexer(CharStreams.fromString(source));

        CommonTokenStream tokens = new CommonTokenStream(lexer);
        tokens.fill();

        System.out.println("TOKEN TYPE\tLEXEME\tLINE\tCOLUMN");

        for (Token token : tokens.getTokens()) {

            if (token.getType() == Token.EOF) {
                break;
            }

            String tokenType = lexer.getVocabulary()
                    .getSymbolicName(token.getType());

            System.out.println(
                    tokenType + "\t\t" +
                            token.getText() + "\t" +
                            token.getLine() + "\t" +
                            (token.getCharPositionInLine() + 1)
            );
        }
    }
}