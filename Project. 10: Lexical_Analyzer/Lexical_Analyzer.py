import re

# -------- CONSTANTS --------

KEYWORDS = {
    "class", "constructor", "function", "method",
    "field", "static", "var", "int", "char", "boolean",
    "void", "true", "false", "null", "this",
    "let", "do", "if", "else", "while", "return"
}

SYMBOLS = {
    '{', '}', '(', ')', '[', ']',
    '.', ',', ';', '+', '-', '*', '/',
    '&', '|', '<', '>', '=', '~'
}

# -------- GLOBAL STATE --------

code = ""
index = 0
current_token = None
current_type = None


# -------- INITIALIZE --------

def main():
    input_file = "Class.jack"
    output_file = "Class.xml"

    # Initialize tokenizer
    initTokenizer(input_file)

    # Open XML file
    xmlFile = open(output_file, "w")

    # IMPORTANT:
    # For parser output we DO NOT write <tokens>
    # That was only for tokenizer test.

    # Start parsing
    advance()              # move to first token
    compileClass(xmlFile)  # top-level rule

    xmlFile.close()
    print("Parsing complete.")

    
def initTokenizer(input_file):
    global code, index
    with open(input_file, "r") as f:
        code = f.read()

    code = removeComments(code)
    index = 0


# -------- MAIN FUNCTIONS --------

def hasMoreTokens():
    skipWhitespace()
    return index < len(code)


def advance():
    global index, current_token, current_type

    skipWhitespace()

    if index >= len(code):
        return

    char = code[index]

    # SYMBOL
    if char in SYMBOLS:
        current_token = char
        current_type = "SYMBOL"
        index += 1
        return

    # STRING CONSTANT
    if char == '"':
        index += 1
        start = index
        while code[index] != '"':
            index += 1
        current_token = code[start:index]
        current_type = "STRING_CONST"
        index += 1
        return

    # INTEGER CONSTANT
    if char.isdigit():
        start = index
        while index < len(code) and code[index].isdigit():
            index += 1
        current_token = code[start:index]
        current_type = "INT_CONST"
        return

    # IDENTIFIER OR KEYWORD
    if char.isalpha() or char == "_":
        start = index
        while index < len(code) and (code[index].isalnum() or code[index] == "_"):
            index += 1

        word = code[start:index]

        if word in KEYWORDS:
            current_type = "KEYWORD"
        else:
            current_type = "IDENTIFIER"

        current_token = word
        return


def tokenType():
    return current_type


def token():
    return current_token


# -------- HELPERS --------

def skipWhitespace():
    global index
    while index < len(code) and code[index].isspace():
        index += 1


def removeComments(text):
    text = re.sub(r"//.*", "", text)
    text = re.sub(r"/\*.*?\*/", "", text, flags=re.DOTALL)
    return text

def writeToken(xmlFile):
    ttype = tokenType()
    tvalue = token()

    tagMap = {
        "KEYWORD": "keyword",
        "SYMBOL": "symbol",
        "IDENTIFIER": "identifier",
        "INT_CONST": "integerConstant",
        "STRING_CONST": "stringConstant"
    }

    tag = tagMap[ttype]

    # Escape special symbols
    if tvalue == "<":
        tvalue = "&lt;"
    elif tvalue == ">":
        tvalue = "&gt;"
    elif tvalue == "&":
        tvalue = "&amp;"

    xmlFile.write(f"<{tag}> {tvalue} </{tag}>\n")
initTokenizer("Class.jack")

xmlFile = open("output.xml", "w")
xmlFile.write("<tokens>\n")
while hasMoreTokens():
    advance()
    writeToken(xmlFile)

xmlFile.write("</tokens>\n")
xmlFile.close()

# Assumes:
# advance()
# token()
# tokenType()
# writeToken(xmlFile)
# hasMoreTokens()

# -----------------------------

def writeCurrent(xmlFile):
    writeToken(xmlFile)

# -----------------------------

def compileClass(xmlFile):
    xmlFile.write("<class>\n")

    writeCurrent(xmlFile)  # 'class'
    advance()

    writeCurrent(xmlFile)  # className
    advance()

    writeCurrent(xmlFile)  # '{'
    advance()

    while token() in ("static", "field"):
        compileClassVarDec(xmlFile)

    while token() in ("constructor", "function", "method"):
        compileSubroutine(xmlFile)

    writeCurrent(xmlFile)  # '}'
    advance()

    xmlFile.write("</class>\n")

# -----------------------------

def compileClassVarDec(xmlFile):
    xmlFile.write("<classVarDec>\n")

    while token() != ";":
        writeCurrent(xmlFile)
        advance()

    writeCurrent(xmlFile)  # ';'
    advance()

    xmlFile.write("</classVarDec>\n")

# -----------------------------

def compileSubroutine(xmlFile):
    xmlFile.write("<subroutineDec>\n")

    writeCurrent(xmlFile)  # constructor/function/method
    advance()

    writeCurrent(xmlFile)  # return type
    advance()

    writeCurrent(xmlFile)  # subroutine name
    advance()

    writeCurrent(xmlFile)  # '('
    advance()

    compileParameterList(xmlFile)

    writeCurrent(xmlFile)  # ')'
    advance()

    compileSubroutineBody(xmlFile)

    xmlFile.write("</subroutineDec>\n")

# -----------------------------

def compileParameterList(xmlFile):
    xmlFile.write("<parameterList>\n")

    while token() != ")":
        writeCurrent(xmlFile)
        advance()

    xmlFile.write("</parameterList>\n")

# -----------------------------

def compileSubroutineBody(xmlFile):
    xmlFile.write("<subroutineBody>\n")

    writeCurrent(xmlFile)  # '{'
    advance()

    while token() == "var":
        compileVarDec(xmlFile)

    compileStatements(xmlFile)

    writeCurrent(xmlFile)  # '}'
    advance()

    xmlFile.write("</subroutineBody>\n")

# -----------------------------

def compileVarDec(xmlFile):
    xmlFile.write("<varDec>\n")

    while token() != ";":
        writeCurrent(xmlFile)
        advance()

    writeCurrent(xmlFile)  # ';'
    advance()

    xmlFile.write("</varDec>\n")

# -----------------------------

def compileStatements(xmlFile):
    xmlFile.write("<statements>\n")

    while token() in ("let", "if", "while", "do", "return"):
        if token() == "let":
            compileLet(xmlFile)
        elif token() == "if":
            compileIf(xmlFile)
        elif token() == "while":
            compileWhile(xmlFile)
        elif token() == "do":
            compileDo(xmlFile)
        elif token() == "return":
            compileReturn(xmlFile)

    xmlFile.write("</statements>\n")

# -----------------------------

def compileLet(xmlFile):
    xmlFile.write("<letStatement>\n")

    while token() != ";":
        if token() == "[":
            writeCurrent(xmlFile)
            advance()
            compileExpression(xmlFile)
        else:
            writeCurrent(xmlFile)
            advance()

    writeCurrent(xmlFile)  # ';'
    advance()

    xmlFile.write("</letStatement>\n")

# -----------------------------

def compileIf(xmlFile):
    xmlFile.write("<ifStatement>\n")

    while token() != "{":
        writeCurrent(xmlFile)
        advance()

    writeCurrent(xmlFile)  # '{'
    advance()

    compileStatements(xmlFile)

    writeCurrent(xmlFile)  # '}'
    advance()

    if token() == "else":
        writeCurrent(xmlFile)
        advance()

        writeCurrent(xmlFile)  # '{'
        advance()

        compileStatements(xmlFile)

        writeCurrent(xmlFile)  # '}'
        advance()

    xmlFile.write("</ifStatement>\n")

# -----------------------------

def compileWhile(xmlFile):
    xmlFile.write("<whileStatement>\n")

    while token() != "{":
        writeCurrent(xmlFile)
        advance()

    writeCurrent(xmlFile)  # '{'
    advance()

    compileStatements(xmlFile)

    writeCurrent(xmlFile)  # '}'
    advance()

    xmlFile.write("</whileStatement>\n")

# -----------------------------

def compileDo(xmlFile):
    xmlFile.write("<doStatement>\n")

    while token() != ";":
        writeCurrent(xmlFile)
        advance()

    writeCurrent(xmlFile)  # ';'
    advance()

    xmlFile.write("</doStatement>\n")

# -----------------------------

def compileReturn(xmlFile):
    xmlFile.write("<returnStatement>\n")

    while token() != ";":
        if token() != ";":
            if token() not in (";"):
                if tokenType() in ("IDENTIFIER", "INT_CONST", "STRING_CONST") or token() in ("(", "-", "~"):
                    compileExpression(xmlFile)
                    continue
        writeCurrent(xmlFile)
        advance()

    writeCurrent(xmlFile)  # ';'
    advance()

    xmlFile.write("</returnStatement>\n")

# -----------------------------

def compileExpression(xmlFile):
    xmlFile.write("<expression>\n")

    compileTerm(xmlFile)

    while token() in ("+", "-", "*", "/", "&", "|", "<", ">", "="):
        writeCurrent(xmlFile)
        advance()
        compileTerm(xmlFile)

    xmlFile.write("</expression>\n")

# -----------------------------

def compileTerm(xmlFile):
    xmlFile.write("<term>\n")

    if token() == "(":
        writeCurrent(xmlFile)
        advance()
        compileExpression(xmlFile)
        writeCurrent(xmlFile)
        advance()

    elif token() in ("-", "~"):
        writeCurrent(xmlFile)
        advance()
        compileTerm(xmlFile)

    else:
        writeCurrent(xmlFile)
        advance()

        if token() == "[":
            writeCurrent(xmlFile)
            advance()
            compileExpression(xmlFile)
            writeCurrent(xmlFile)
            advance()

        elif token() == "(":
            writeCurrent(xmlFile)
            advance()
            compileExpressionList(xmlFile)
            writeCurrent(xmlFile)
            advance()

        elif token() == ".":
            writeCurrent(xmlFile)
            advance()
            writeCurrent(xmlFile)
            advance()
            writeCurrent(xmlFile)
            advance()
            compileExpressionList(xmlFile)
            writeCurrent(xmlFile)
            advance()

    xmlFile.write("</term>\n")

# -----------------------------

def compileExpressionList(xmlFile):
    xmlFile.write("<expressionList>\n")

    if token() != ")":
        compileExpression(xmlFile)

        while token() == ",":
            writeCurrent(xmlFile)
            advance()
            compileExpression(xmlFile)

    xmlFile.write("</expressionList>\n")

