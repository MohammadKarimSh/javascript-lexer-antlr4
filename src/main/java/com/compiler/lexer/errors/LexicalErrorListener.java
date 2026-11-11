package com.compiler.lexer.errors;

import org.antlr.v4.runtime.BaseErrorListener;
import org.antlr.v4.runtime.Recognizer;
import org.antlr.v4.runtime.RecognitionException;

import java.util.ArrayList;
import java.util.List;

public class LexicalErrorListener extends BaseErrorListener {

    private final List<String> errors = new ArrayList<>();

    @Override
    public void syntaxError(
            Recognizer<?, ?> recognizer,
            Object offendingSymbol,
            int line,
            int charPositionInLine,
            String msg,
            RecognitionException e
    ) {
        String error = String.format(
                "Line %d, Column %d: %s",
                line,
                charPositionInLine + 1,
                msg
        );

        errors.add(error);
    }

    public List<String> getErrors() {
        return errors;
    }

    public boolean hasErrors() {
        return !errors.isEmpty();
    }

    public void printErrors() {

        if (errors.isEmpty()) {
            System.out.println("\nNo lexical errors found.");
            return;
        }

        System.out.println("\n========== LEXICAL ERRORS ==========");

        for (int i = 0; i < errors.size(); i++) {
            System.out.println((i + 1) + ". " + errors.get(i));
        }

        System.out.println("Total Errors: " + errors.size());
    }
}