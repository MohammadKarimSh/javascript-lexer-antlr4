package com.compiler.lexer;

import com.compiler.lexer.engine.LexerRunner;
import com.compiler.lexer.errors.LexicalErrorListener;
import com.compiler.lexer.errors.TokenErrorChecker;
import com.compiler.lexer.output.TokenPrinter;
import org.antlr.v4.runtime.CommonTokenStream;

import java.io.IOException;
import java.nio.charset.StandardCharsets;
import java.nio.file.Files;
import java.nio.file.Path;
import java.nio.file.Paths;

public class Main {

    private static final String DEFAULT_FILE = "examples/valid/string.js";

    public static void main(String[] args) {
        String filePath = args.length > 0 ? args[0] : DEFAULT_FILE;
        Path path = Paths.get(filePath);

        String source;
        try {
            source = Files.readString(path, StandardCharsets.UTF_8);
        } catch (IOException e) {
            System.err.println("Cannot read file: " + path.toAbsolutePath());
            System.err.println("Reason: " + e.getMessage());
            System.exit(1);
            return;
        }

        LexicalErrorListener errorListener = new LexicalErrorListener();
        CommonTokenStream tokens = LexerRunner.analyze(source, errorListener);

        TokenErrorChecker.check(tokens, errorListener);
        TokenPrinter.printTokens(tokens);
        errorListener.printErrors();
    }
}