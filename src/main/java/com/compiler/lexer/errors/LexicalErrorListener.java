package com.compiler.lexer.errors;

import org.antlr.v4.runtime.BaseErrorListener;
import org.antlr.v4.runtime.RecognitionException;
import org.antlr.v4.runtime.Recognizer;

import java.util.ArrayList;
import java.util.List;

public class LexicalErrorListener extends BaseErrorListener {

    // Order: line:column  (same order as TokenPrinter)
    private static final String ERROR_FORMAT = "Error at %d:%d %s";

    private final List<String> errors = new ArrayList<>();

    @Override
    public void syntaxError(Recognizer<?, ?> recognizer, Object offendingSymbol,
                            int line, int charPositionInLine,
                            String msg, RecognitionException e) {
        report(line, charPositionInLine + 1, msg);
    }

    public void report(int line, int column, String msg) {
        errors.add(String.format(ERROR_FORMAT, line, column, msg));
    }

    public List<String> getErrors() { return errors; }

    public boolean hasErrors() { return !errors.isEmpty(); }

    public void printErrors() {
        System.out.println("--- Lexical Errors: " + errors.size() + " ---");
        for (String error : errors) {
            System.out.println(error);
        }
    }
}