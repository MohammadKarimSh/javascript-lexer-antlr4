package com.compiler.lexer.errors;

import com.compiler.lexer.generated.JavaScriptLexer;
import org.antlr.v4.runtime.CommonTokenStream;
import org.antlr.v4.runtime.Token;

public class TokenErrorChecker {

    public static void check(CommonTokenStream tokens, LexicalErrorListener listener) {
        for (Token t : tokens.getTokens()) {
            int line = t.getLine();
            int col = t.getCharPositionInLine() + 1;
            String text = t.getText();

            switch (t.getType()) {
                case JavaScriptLexer.ERROR_CHAR ->
                        listener.report(line, col, "Invalid or unexpected token '" + text + "'");

                case JavaScriptLexer.UNCLOSED_DOUBLE_STRING,
                     JavaScriptLexer.UNCLOSED_SINGLE_STRING ->
                        listener.report(line, col, "Invalid or unexpected token (unclosed string literal)");

                case JavaScriptLexer.UNCLOSED_TEMPLATE ->
                        listener.report(line, col, "Unclosed template literal");

                case JavaScriptLexer.UNCLOSED_COMMENT ->
                        listener.report(line, col, "Unclosed multi-line comment");

                case JavaScriptLexer.INVALID_NUMBER ->
                        listener.report(line, col, describeInvalidNumber(text) + ": '" + text + "'");
                case JavaScriptLexer.INVALID_EXPONENT ->
                        listener.report(line, col,
                                "Exponent has no digits: '" + text + "'");
                default -> { }
            }
        }
    }

    private static String describeInvalidNumber(String t) {
        if (t.matches("0[xX].*")) return "Invalid hexadecimal literal";
        if (t.matches("0[oO].*")) return "Invalid octal literal";
        if (t.matches("0[bB].*")) return "Invalid binary literal";
        if (t.matches("0_.*"))    return "Numeric separator '_' not allowed after leading 0";
        if (t.contains("__"))     return "Numeric separator '_' cannot be repeated";
        if (t.endsWith("_"))      return "Numeric separator '_' must be between digits";
        if (t.matches("[0-9._]+[eE][+-]?")) return "Exponent has no digits";
        if (t.matches("0[0-9]+")) return "Invalid number (digits 8 or 9 in an octal literal)";
        if (t.matches("[0-9._]*[0-9][a-zA-Z_].*"))
            return "Identifier or suffix cannot directly follow a number";
        return "Malformed numeric literal";
    }
}