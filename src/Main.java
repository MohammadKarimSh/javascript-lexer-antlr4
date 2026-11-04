import org.antlr.v4.runtime.*;
import org.antlr.v4.runtime.tree.*;

public class Main {
    public static void main(String[] args) throws Exception {
        CharStream input = CharStreams.fromString("hello world");

        TestLexer lexer = new TestLexer(input);
        CommonTokenStream tokens = new CommonTokenStream(lexer);
        TestParser parser = new TestParser(tokens);

        ParseTree tree = parser.r();
        System.out.println("Parse Tree: " + tree.toStringTree(parser));
    }
}