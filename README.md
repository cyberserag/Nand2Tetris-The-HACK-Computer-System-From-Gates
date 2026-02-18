# Nand2Tetris-The-HACK-Computer-System-From-Gates
> “Tell me and I forget. Teach me and I remember. Involve me and I learn.” — Benjamin Franklin

The Nand to Tetris project is a fascinating journey into the foundations of computer systems, taking me from Boolean algebra and elementary logic gates all the way to building a complete general-purpose computer capable of running high-level programs.

In the hardware phase, I construct the system from the ground up — designing the CPU, memory units, and overall architecture. Rather than using physical components, the entire computer is built and tested on my own machine through a hardware simulator, mirroring how modern computer engineers prototype real-world systems.

In the software phase, I develop a full software hierarchy that enables the translation and execution of object-oriented, high-level programs on this minimal hardware platform. This includes implementing a virtual machine, a compiler for a simple Java-like language, and a basic operating system that bridges the gap between software and hardware.

Throughout the process, I gain hands-on experience with core computer science concepts such as stack processing, parsing, code generation, memory management, vector graphics, input/output handling, and fundamental data structures and algorithms — all of which form up the backbone of modern computing systems.

# What’s the big picture here?
<img width="1071" height="738" alt="image" src="https://github.com/user-attachments/assets/342ff053-ca04-4d20-b272-f9fed122e6e2" />


- **Hardware:** Digital logic design including logic gates, Boolean arithmetic, multiplexers, flip-flops, registers, RAM modules, and counters. Implementation using Hardware Description Language (HDL), with systematic chip simulation and verification.
- **Computer Architecture:** ALU and CPU design, machine-level instruction sets, assembly programming, addressing modes, and memory-mapped I/O integration.
- **Operating Systems:** Core OS services including memory management, mathematical utilities, device-level I/O handling, screen control, file operations, and runtime support for high-level languages.
- **Programming Languages:** Object-based programming principles, abstract data types, scope management, syntax and semantic analysis, and reference handling.
- **Compilers:** Lexical analysis, recursive-descent (top-down) parsing, symbol table construction, virtual stack machine design, code generation, and support for arrays and object structures.
- **Data Structures & Algorithms:** Implementation of stacks, hash tables, linked lists, recursion techniques, arithmetic and geometric algorithms, and runtime complexity analysis.
- **Software Engineering:** Modular system design, interface–implementation separation, API development and documentation, structured testing strategies, large-scale program organization, and quality assurance practices.

# Ongoing Sub-Projects:

### **Computer Hardware & Architecture**

1. **Elementary Logic Gates** ✔️ Designing and building fundamental logic gates like AND, OR, NOT, multiplexers, and more.
2. **Adders & ALU** ✔️ Constructing a family of adder chips, leading up to a fully functional Arithmetic Logic Unit (ALU).
3. **Memory Units** ✔️ Creating registers and memory modules, culminating in a Random Access Memory (RAM) implementation.
4. **HACK Machine Language** ✔️ Learning a low-level machine language and writing illustrative programs to understand CPU operations.
5. **Computer Architecture & CPU** ✔️ Integrating projects 1–3 to build a Central Processing Unit (CPU) and a hardware platform capable of executing programs from project 4.

### **Computer Software Hierarchy**

1. **HACK Assembler** ✔️ Developed an assembler to translate symbolic machine language programs into binary executable code.
2. **Virtual Machine I: Stack Arithmetic** ✔️ Built a stack-based virtual machine handling arithmetic and memory access operations, forming the backend of a two-tier compiler.
3. **Virtual Machine II: Program Control** ✔️ Completed the VM translator by implementing branching and function-calling commands, supporting program flow, loops, and stack-based function handling.
4. **High-Level Language (JACK)** ✔️ Designed and implemented JACK, an object-based, Java-like language, supporting procedural and object-oriented programming, classes, methods, recursion, interactive applications (e.g., Hell Arena Game), and graphics optimization.
5. **Compiler I: Syntax Analysis** ✔️ Built a two-tier compiler front-end for JACK. Implemented lexical analysis (tokenizing) and parsing, generating parse trees and XML representations to analyze program syntax.
6. **Compiler II: Code Generation** ⏳ Finishing the full JACK compiler by generating VM code for procedural programs, arrays, and objects. Concepts: recursive compilation, symbol tables, memory management, and code generation techniques.
7. **Operating System** ⏳ Implementing a simple, full operating system for the HACK computer.

