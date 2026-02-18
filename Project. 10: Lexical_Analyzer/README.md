### **Project 10: Compiler I – Syntax Analysis and the Foundations of Language Understanding**

The full pic for the two-tier compiler:
<img width="1435" height="585" alt="image" src="https://github.com/user-attachments/assets/24798590-dd53-401f-bcac-f4506720fdd7" />
In Project 10, I took the first major step toward building a **full compiler** for the JACK high-level language by focusing on **syntax analysis**, the foundational stage where a compiler “understands” the structure of the code. Unlike later stages of the compiler, this project **does not generate executable code**. Instead, it is concerned with determining whether the input program adheres to the language’s grammar and syntax rules.

A compiler demonstrates its understanding of a language by producing **correctly functioning code**. However, since this project is limited to the **syntax analyzer module**, we needed a way to verify correctness **without running executable output**. The solution was elegant: I implemented the syntax analyzer to produce **XML output** that mirrors the hierarchical structure of the input JACK program. By inspecting the resulting XML, it is possible to verify that the analyzer is correctly parsing the code and identifying syntactic elements, such as expressions, statements, and procedural blocks.

---

### **Tokenizing – Breaking Code into Fundamental Units**
<img width="1025" height="489" alt="image" src="https://github.com/user-attachments/assets/1f0cc5e2-b757-4422-8b64-fa29b1f1f8af" />

The first step in syntax analysis is **tokenizing**—splitting the source program into **atomic units called tokens**. Each token represents a fundamental piece of the language: keywords, symbols, identifiers, constants, or operators.

For example, in a simple expression like `count <= 100;`, tokenizing transforms the raw text into individual, meaningful components:

- `count` → identifier
- `<=` → operator
- `100` → constant
- `;` → statement terminator

This decomposition is critical because it allows the parser to operate on **structured elements** rather than raw text, making the next phase—**grammar-based parsing**—feasible and precise.

---

### **Parsing and Context-Free Grammars – Teaching the Compiler the Language Rules**

Once tokenized, the compiler uses a **formal grammar** to understand how tokens can be legally combined. Most programming languages, including JACK, are defined using **context-free grammars (CFGs)**. A CFG specifies:

- How **basic elements (terminals)** can be combined to form **complex constructs (non-terminals)**.
- How the program’s **syntactic hierarchy** is structured, from expressions and statements to entire class and method definitions.

For example, in the expression `count <= 100`, the grammar allows us to validate that this is indeed a **valid relational expression**.

Parsing works by essentially reversing the grammar: given a sequence of tokens, the parser reconstructs the **syntactic structure**, producing a tree-like representation that mirrors how high-level language constructs are composed. These parse trees, reflected in the XML output, allow both humans and programs to **inspect the program structure** and confirm correctness.
The first step in syntax analysis is **tokenizing**—splitting the source program into **atomic units called tokens**. Each token represents a fundamental piece of the language: keywords, symbols, identifiers, constants, or operators.

For example, in a simple expression like `count <= 100;`, tokenizing transforms the raw text into individual, meaningful components:

- `count` → identifier
- `<=` → operator
- `100` → constant
- `;` → statement terminator

This decomposition is critical because it allows the parser to operate on **structured elements** rather than raw text, making the next phase—**grammar-based parsing**—feasible and precise.

---

### **Parsing and Context-Free Grammars – Teaching the Compiler the Language Rules**

Once tokenized, the compiler uses a **formal grammar** to understand how tokens can be legally combined. Most programming languages, including JACK, are defined using **context-free grammars (CFGs)**. A CFG specifies:

- How **basic elements (terminals)** can be combined to form **complex constructs (non-terminals)**.
- How the program’s **syntactic hierarchy** is structured, from expressions and statements to entire class and method definitions.

For example, in the expression `count <= 100`, the grammar allows us to validate that this is indeed a **valid relational expression**.

Parsing works by essentially reversing the grammar: given a sequence of tokens, the parser reconstructs the **syntactic structure**, producing a tree-like representation that mirrors how high-level language constructs are composed. These parse trees, reflected in the XML output, allow both humans and programs to **inspect the program structure** and confirm correctness.
<img width="889" height="847" alt="image" src="https://github.com/user-attachments/assets/b9c4562e-08d3-4d0e-b437-272f42f7ca48" />

### **Key Insights and Learnings**

Through this project, I gained deep insight into how compilers “think”:

1. **From text to structure** – How raw source code is transformed into a formal representation that a machine can interpret.
2. **The dual role of grammar** – Declaratively specifying valid syntax, and analytically guiding parsing.
3. **Verification without execution** – Using XML outputs to validate that the compiler correctly understands programs, even without generating machine code.
4. **Building the foundation for a two-tier compiler** – This syntax analyzer will later feed into the code generation stages (Projects 11–12), enabling the translation of high-level JACK programs into **virtual machine instructions**, and ultimately into Hack machine code.

By the end of Project 10, I had successfully implemented a **robust, fully functional syntax analyzer**

a key stepping stone in building a compiler capable of understanding, processing, and eventually executing a high-level programming language.

