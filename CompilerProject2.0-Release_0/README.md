# Lexer and Parser Project

This project includes a lexer and parser for a custom programming language, using JFlex for lexical analysis and CUP for parsing. The project processes test files to validate syntax and generate tokens according to the language's defined grammar.

In this phase we are only detecting the valid tokens and also checking if they are valid or not.

There are 3 test files inside the testfiles folder which checks for the following:
1. **Regex**
2. **Terminal symbols**
3. **Fail-case**


### Prerequisites

- Java Development Kit (JDK)
- JFlex
- CUP Parser Generator for Java

## Running the Tests

Go to the project directory **CompilerProject2.0-Release_0**

Please do **$ make clean** as it cleans up all compiled files.

To compile the program(Lexer and Parser) do **$ make all**

1. To run specific test file:
    - place the contents of input inside the **basicTest.txt**
    - do **$ make run**
    - an output will be generated in the **basicTest-output.txt** file and also it will be printed on the terminal with input and output file.

2. To run the multiple tests and generate output files:

1. Place your `.txt` test files inside the `testfiles/` directory.
2. Execute the following command:

```sh
make test
