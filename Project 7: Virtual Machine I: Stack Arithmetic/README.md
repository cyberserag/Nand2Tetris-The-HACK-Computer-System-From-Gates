# Project 7: Virtual Machine I – Stack Arithmetic & Memory Access
<img width="1038" height="521" alt="image" src="https://github.com/user-attachments/assets/2fe7a93f-660b-4888-ae4e-0d6d5c59459e" />

In this stage, I began building the **backend of a compiler** for an object-based high-level language by first designing a **virtual machine (VM)**. The VM acts as an **abstract computer**—it doesn’t exist physically, but can be implemented on other platforms. This allows programs to be **portable across multiple systems**, running without modification on different processors or operating systems.

I focused on **implementing the VM over the Hack platform**. This involved creating a **VM language** with commands for **arithmetic operations** and **memory access**, enabling high-level programs to be translated into **intermediate code**.

Key highlights of this project:

- **Stack-based computation**: All operations rely on a stack, giving a hands-on understanding of this elegant and versatile data structure.
- **Intermediate code execution**: The VM runs as if it were a real machine, demonstrating how one computer can emulate another—a concept pioneered by Alan Turing in the 1930s.
- **VM translator development**: I wrote a program to convert VM commands into Hack assembly, bridging abstract instructions with actual hardware execution.
<img width="1024" height="779" alt="image" src="https://github.com/user-attachments/assets/688e6f89-9c6b-4580-ad03-3dcf1b3ea690" />

This project laid the foundation for a full-scale virtual machine, illustrating core computer science concepts like stack processing, abstraction, and platform-independent execution, while preparing for more advanced VM features in the next stage.
