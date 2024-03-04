JAVA=java
JAVAC=javac
JFLEX=$(JAVA) -jar jflex-full-1.8.2.jar
CUPJAR=./java-cup-11b.jar
CUP=$(JAVA) -jar $(CUPJAR)
CP=.:$(CUPJAR)
TESTFILES=$(wildcard testfiles/*.txt)


default: run

.SUFFIXES: $(SUFFIXES) .class .java

.java.class:
		$(JAVAC) -cp $(CP) $*.java

FILE=    Lexer.java      parser.java    sym.java \
    LexerTest.java

run: basicTest.txt

all: Lexer.java parser.java $(FILE:java=class)

basicTest.txt: all
		$(JAVA) -cp $(CP) LexerTest basicTest.txt > basicTest-output.txt 2>&1
		cat basicTest.txt
		cat -n basicTest-output.txt

clean:
		@echo "Removing output files..."
		rm -f *.class *~ *.bak Lexer.java parser.java sym.java
		rm -f testfiles/*-output.txt
		@echo "Removed output files."


Lexer.java: tokens.jflex
		$(JFLEX) tokens.jflex

parser.java: grammar.cup
		$(CUP) -interface < grammar.cup

parserD.java: grammar.cup
		$(CUP) -interface -dump < grammar.cup

test: clean all
		@for file in $(TESTFILES); do \
		base=$$(basename $$file .txt); \
		outputfile=testfiles/$$base-output.txt; \
		echo "Testcase: $$file"; \
		echo "Input:"; \
		cat $$file; \
		echo ""; \
		echo "Output:"; \
		$(JAVA) -cp $(CP) LexerTest $$file > $$outputfile 2>&1; \
		cat $$outputfile; \
		echo "----------------------------------------"; \
		done



