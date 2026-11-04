import org.antlr.v4.runtime.*;

public class Main {
    public static void main(String[] args) throws Exception {
        CharStream input = CharStreams.fromString("var x = 5;");
        JavaScriptLexer lexer = new JavaScriptLexer(input);

        for (Token t : lexer.getAllTokens()) {
            String type = JavaScriptLexer.VOCABULARY.getSymbolicName(t.getType());
            System.out.println("[" + t.getText() + "] <" + type + "> ("
                + t.getLine() + ":" + t.getCharPositionInLine() + ")");
        }
    }
}
