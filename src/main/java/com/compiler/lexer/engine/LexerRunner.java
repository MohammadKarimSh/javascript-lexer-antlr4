package com.compiler.lexer.engine;

import com.compiler.lexer.errors.LexicalErrorListener;
import com.compiler.lexer.generated.JavaScriptLexer;

import org.antlr.v4.runtime.CharStreams;
import org.antlr.v4.runtime.CommonTokenStream;

public class LexerRunner {

    public static CommonTokenStream analyze(
            String source,
            LexicalErrorListener errorListener
    ) {

        JavaScriptLexer lexer =
                new JavaScriptLexer(CharStreams.fromString(source));

        lexer.removeErrorListeners();

        lexer.addErrorListener(errorListener);

        CommonTokenStream tokens = new CommonTokenStream(lexer);

        tokens.fill();

        return tokens;
    }
}