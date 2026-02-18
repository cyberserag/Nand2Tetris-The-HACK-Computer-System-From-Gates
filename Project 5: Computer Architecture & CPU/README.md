### **Project 5: Assembling the Hack Computer – From Components to a Full System**

After completing the first four projects, I was ready to bring everything together. We had:

1. Built **elementary logic gates** (Project 1),
2. Constructed an **Arithmetic Logic Unit (ALU)** (Project 2),
3. Created **RAM modules** (Project 3), and
4. Written programs in **HACK machine language** (Project 4).

Project 5 focused on **assembling these building blocks into a fully functional, 16-bit general-purpose computer**—the **Hack platform**. The goal was to design a complete **Central Processing Unit (CPU)** and integrate it with memory and I/O devices, creating a system capable of executing programs written in Hack machine language.

---

### **Hack Hardware Platform Overview**

<img width="1225" height="629" alt="image" src="https://github.com/user-attachments/assets/689edc30-3085-49d8-a00e-0f24ae1cfe2b" />


The Hack computer is a **16-bit von Neumann machine**, comprising:

- A **CPU** that executes instructions,
- Two separate **memory modules**: one for instructions (ROM) and one for data (RAM),
- Two **memory-mapped I/O devices**: a screen and a keyboard.

Programs reside in **instruction memory**, a read-only device, which can be preloaded via ROM. In a simulation environment, this is achieved by loading Hack machine-language programs from a text file. The CPU interacts with both instruction and data memory, reading instructions and executing them while reading/writing data values.

---

### **CPU Design and Abstraction**

<img width="1057" height="481" alt="image" src="https://github.com/user-attachments/assets/3ae8629c-5e4b-49a3-acba-3a5e50ba706d" />

The **CPU** is the heart of the Hack platform. It executes **16-bit Hack instructions** and coordinates the computer’s operations. Its design integrates:

- The **ALU**, capable of performing all arithmetic and logical operations defined by Hack instructions,
- **Registers**, which store intermediate results,
- **Control logic**, responsible for **instruction decoding**, **execution**, and **next instruction fetching**.

The CPU’s control logic ensures:

1. **Instruction Decoding** – Determining the meaning of each instruction.
2. **Instruction Execution** – Signaling the relevant components (ALU, registers, memory) to carry out operations.
3. **Next Instruction Fetching** – Identifying which instruction to execute next, based on current instruction and ALU outputs.

By connecting these elements intelligently, the CPU could seamlessly execute Hack programs step by step, simulating the operations of a real computer at the hardware level.

<img width="1155" height="655" alt="image" src="https://github.com/user-attachments/assets/da5557f7-2176-45f4-b9b7-d514defe7c5a" />

---

### **Memory Integration**

<img width="821" height="557" alt="image" src="https://github.com/user-attachments/assets/165062bb-5f24-4c8c-95a5-708b25d6685c" />


**Instruction Memory (ROM)**

- Implemented as a **direct-access Read-Only Memory** with 32K 16-bit registers.
- Provides a static program that the CPU can fetch and execute.

**Data Memory (RAM)**

- Functions like the RAM modules from Project 3.
- **Reading**: Provide the address, read the contents directly (combinational operation).
- **Writing**: Provide a value and an address, assert the load signal, and the memory commits the value in the next clock cycle (sequential operation).
- Serves as both **general-purpose storage** and an **interface with I/O devices** using memory mapping.

---

### **Computer Architecture & Integration**

<img width="1067" height="549" alt="image" src="https://github.com/user-attachments/assets/04042b3a-8e97-4d61-8671-f12bde18ba5b" />


Once the **CPU and memory modules** were individually tested, assembling the overall Hack computer became straightforward:

- The CPU fetches instructions from ROM, executes them via the ALU and registers, and reads/writes data to RAM.
- Memory-mapped I/O allows the CPU to communicate with the screen and keyboard, making the system interactive.
- The integration of these modules created a **fully operational computer**, capable of running the Hack machine-language programs developed in Project 4.

This project was the first time I saw a **complete hardware platform in action**, connecting logical gates, arithmetic units, memory, and control into a single, functional system. It offered a **holistic view of computer architecture**, bridging the gap between individual hardware components and a full computing system.
