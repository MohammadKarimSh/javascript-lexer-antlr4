package com.compiler.lexer;

import com.compiler.lexer.engine.LexerRunner;
import com.compiler.lexer.errors.LexicalErrorListener;
import com.compiler.lexer.output.TokenPrinter;

import org.antlr.v4.runtime.CommonTokenStream;

public class Main {

    public static void main(String[] args) {

        String source = """
        let age = 20;
        const total = age + 5;
        let result = @;
        """;

        LexicalErrorListener errorListener =
                new LexicalErrorListener();

        CommonTokenStream tokens =
                LexerRunner.analyze(source, errorListener);

        TokenPrinter.printTokens(tokens);

        errorListener.printErrors();
    }
}