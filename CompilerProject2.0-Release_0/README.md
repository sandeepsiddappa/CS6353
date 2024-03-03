# Lexer and Parser Project

This project includes a lexer and parser for a custom programming language, utilizing JFlex for lexical analysis and CUP for parsing. In this inital project's phase, primary goal at this phase is to identify valid tokens and check their validity.

Included in the `testfiles` folder are three test files designed to check the following aspects:
1. Regex patterns
2. Terminal symbols
3. Fail-case scenarios

## Prerequisites

Before running the tests, ensure the following software is installed on your system:

- Java Development Kit (JDK)
- JFlex - The fast scanner generator for Java
- CUP - Constructor for Useful Parsers, a parser generator for Java

## Running the Tests

Navigate to the project directory `CompilerProject2.0-Release_0` and follow these steps:

1. **Clean the Build:**
   To remove all compiled files and clean up the workspace, execute:
   ```sh
   make clean
   ```

2. **Compile the Lexer and Parser:** 
    To compile the program, run:
    ```sh
    make all
    ```

3. **Run a Specific Test:**
    Place the contents of your input inside `basicTest.txt` file.
    Run the following command to execute the test:
    ```sh
    make run
    ```
    The output will be generated in `basicTest-output.txt` and will also be printed to the terminal along with the input.

4. **Run Multiple Tests:** 
    NOTE: Running this command will do **clean** and **all**
    Add your .txt test files to the `testfiles/` directory.
    To process all tests and generate their output files, execute:
    ```sh
    make test
    ```
    This will create corresponding `-output.txt` files to each test file within the `testfiles/` directory, displaying the results in the terminal.

## Author

**Name:** Sandeep Chikkapla Siddappa  
**Net ID:** sxc220127
