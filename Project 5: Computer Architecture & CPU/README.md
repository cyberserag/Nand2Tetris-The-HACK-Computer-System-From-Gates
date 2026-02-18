### **Project 5: Assembling the Hack Computer – From Components to a Full System**

After completing the first four projects, I was ready to bring everything together. We had:

1. Built **elementary logic gates** (Project 1),
2. Constructed an **Arithmetic Logic Unit (ALU)** (Project 2),
3. Created **RAM modules** (Project 3), and
4. Written programs in **HACK machine language** (Project 4).

Project 5 focused on **assembling these building blocks into a fully functional, 16-bit general-purpose computer**—the **Hack platform**. The goal was to design a complete **Central Processing Unit (CPU)** and integrate it with memory and I/O devices, creating a system capable of executing programs written in Hack machine language.

---

### **Hack Hardware Platform Overview**

![image.png](attachment:1bdcf2d9-05a9-4f35-9859-a68b376d3d87:image.png)

The Hack computer is a **16-bit von Neumann machine**, comprising:

- A **CPU** that executes instructions,
- Two separate **memory modules**: one for instructions (ROM) and one for data (RAM),
- Two **memory-mapped I/O devices**: a screen and a keyboard.

Programs reside in **instruction memory**, a read-only device, which can be preloaded via ROM. In a simulation environment, this is achieved by loading Hack machine-language programs from a text file. The CPU interacts with both instruction and data memory, reading instructions and executing them while reading/writing data values.

---

### **CPU Design and Abstraction**

![image.png](attachment:957dc7ed-c1a7-4eeb-b725-a94c7ecf99b4:image.png)

The **CPU** is the heart of the Hack platform. It executes **16-bit Hack instructions** and coordinates the computer’s operations. Its design integrates:

- The **ALU**, capable of performing all arithmetic and logical operations defined by Hack instructions,
- **Registers**, which store intermediate results,
- **Control logic**, responsible for **instruction decoding**, **execution**, and **next instruction fetching**.

The CPU’s control logic ensures:

1. **Instruction Decoding** – Determining the meaning of each instruction.
2. **Instruction Execution** – Signaling the relevant components (ALU, registers, memory) to carry out operations.
3. **Next Instruction Fetching** – Identifying which instruction to execute next, based on current instruction and ALU outputs.

By connecting these elements intelligently, the CPU could seamlessly execute Hack programs step by step, simulating the operations of a real computer at the hardware level.

![image.png](attachment:5898cd15-5621-4acf-b6ae-8c899e8f79b8:image.png)

---

### **Memory Integration**

![image.png](attachment:eac412aa-3886-4e99-969c-c7f14d5f4c43:image.png)

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

![image.png](attachment:6a20cc9c-7604-477f-9686-b455d1510074:image.png)

Once the **CPU and memory modules** were individually tested, assembling the overall Hack computer became straightforward:

- The CPU fetches instructions from ROM, executes them via the ALU and registers, and reads/writes data to RAM.
- Memory-mapped I/O allows the CPU to communicate with the screen and keyboard, making the system interactive.
- The integration of these modules created a **fully operational computer**, capable of running the Hack machine-language programs developed in Project 4.

This project was the first time I saw a **complete hardware platform in action**, connecting logical gates, arithmetic units, memory, and control into a single, functional system. It offered a **holistic view of computer architecture**, bridging the gap between individual hardware components and a full computing system.
