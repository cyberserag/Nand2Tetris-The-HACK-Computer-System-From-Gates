// bootstrap code
@256
D=A
@SP
M=D
//call Sys.init
@Sys.init$ret.0
//push return address to the stack
D=A
@SP
A=M
M=D
@SP
M=M+1
//push LCL
@LCL
D=M
@SP
A=M
M=D
@SP
M=M+1
//push ARG
@ARG
D=M
@SP
A=M
M=D
@SP
M=M+1
//Push THIS
@THIS
D=M
@SP
A=M
M=D
@SP
M=M+1
//Push THAT
@THAT
D=M
@SP
A=M
M=D
@SP
M=M+1
//Reposition ARG=SP-5-nArgs
@SP
D=M
@5
D=D-A
@0
D=D-A
@ARG
M=D
//Reposition LCL=SP
@SP
D=M
@LCL
M=D
//goto function
@Sys.init
0;JMP
//return label 
(Sys.init$ret.0)
//function Sys.init
(Sys.init)
// push 6
@6
D=A
@SP
A=M
M=D
@SP
M=M+1
    // push 8
@8
D=A
@SP
A=M
M=D
@SP
M=M+1
    //call Class1.set
@Class1.set$ret.1
//push return address to the stack
D=A
@SP
A=M
M=D
@SP
M=M+1
//push LCL
@LCL
D=M
@SP
A=M
M=D
@SP
M=M+1
//push ARG
@ARG
D=M
@SP
A=M
M=D
@SP
M=M+1
//Push THIS
@THIS
D=M
@SP
A=M
M=D
@SP
M=M+1
//Push THAT
@THAT
D=M
@SP
A=M
M=D
@SP
M=M+1
//Reposition ARG=SP-5-nArgs
@SP
D=M
@5
D=D-A
@2
D=D-A
@ARG
M=D
//Reposition LCL=SP
@SP
D=M
@LCL
M=D
//goto function
@Class1.set
0;JMP
//return label 
(Class1.set$ret.1)
//pop temp 0
@SP
M=M-1
@SP
A=M
D=M
@R5
M=D
// push 23
@23
D=A
@SP
A=M
M=D
@SP
M=M+1
    // push 15
@15
D=A
@SP
A=M
M=D
@SP
M=M+1
    //call Class2.set
@Class2.set$ret.2
//push return address to the stack
D=A
@SP
A=M
M=D
@SP
M=M+1
//push LCL
@LCL
D=M
@SP
A=M
M=D
@SP
M=M+1
//push ARG
@ARG
D=M
@SP
A=M
M=D
@SP
M=M+1
//Push THIS
@THIS
D=M
@SP
A=M
M=D
@SP
M=M+1
//Push THAT
@THAT
D=M
@SP
A=M
M=D
@SP
M=M+1
//Reposition ARG=SP-5-nArgs
@SP
D=M
@5
D=D-A
@2
D=D-A
@ARG
M=D
//Reposition LCL=SP
@SP
D=M
@LCL
M=D
//goto function
@Class2.set
0;JMP
//return label 
(Class2.set$ret.2)
//pop temp 0
@SP
M=M-1
@SP
A=M
D=M
@R5
M=D
//call Class1.get
@Class1.get$ret.3
//push return address to the stack
D=A
@SP
A=M
M=D
@SP
M=M+1
//push LCL
@LCL
D=M
@SP
A=M
M=D
@SP
M=M+1
//push ARG
@ARG
D=M
@SP
A=M
M=D
@SP
M=M+1
//Push THIS
@THIS
D=M
@SP
A=M
M=D
@SP
M=M+1
//Push THAT
@THAT
D=M
@SP
A=M
M=D
@SP
M=M+1
//Reposition ARG=SP-5-nArgs
@SP
D=M
@5
D=D-A
@0
D=D-A
@ARG
M=D
//Reposition LCL=SP
@SP
D=M
@LCL
M=D
//goto function
@Class1.get
0;JMP
//return label 
(Class1.get$ret.3)
//call Class2.get
@Class2.get$ret.4
//push return address to the stack
D=A
@SP
A=M
M=D
@SP
M=M+1
//push LCL
@LCL
D=M
@SP
A=M
M=D
@SP
M=M+1
//push ARG
@ARG
D=M
@SP
A=M
M=D
@SP
M=M+1
//Push THIS
@THIS
D=M
@SP
A=M
M=D
@SP
M=M+1
//Push THAT
@THAT
D=M
@SP
A=M
M=D
@SP
M=M+1
//Reposition ARG=SP-5-nArgs
@SP
D=M
@5
D=D-A
@0
D=D-A
@ARG
M=D
//Reposition LCL=SP
@SP
D=M
@LCL
M=D
//goto function
@Class2.get
0;JMP
//return label 
(Class2.get$ret.4)
//generating (END)
(Sys.init$END)
//goto END
@Sys.init$END
0;JMP

//function Class1.set
(Class1.set)
// push argument 0
@0
D=A
@ARG
D=D+M
@R13
M=D
@R13
A=M
D=M
@SP
A=M
M=D
@SP
M=M+1
//pop static 0
@SP
M=M-1
@SP
A=M
D=M
@Class1.0
M=D
// push argument 1
@1
D=A
@ARG
D=D+M
@R13
M=D
@R13
A=M
D=M
@SP
A=M
M=D
@SP
M=M+1
//pop static 1
@SP
M=M-1
@SP
A=M
D=M
@Class1.1
M=D
// push 0
@0
D=A
@SP
A=M
M=D
@SP
M=M+1
    // return
@LCL
D=M
@R14
M=D              // endFrame = LCL

@R14
D=M
@5
A=D-A
D=M
@R15
M=D              // retAddr = *(endFrame-5)

// *ARG = pop()
@SP
AM=M-1
D=M
@ARG
A=M
M=D

// SP = ARG + 1
@ARG
D=M+1
@SP
M=D

// THAT = *(endFrame-1)
@R14
D=M
@1
A=D-A
D=M
@THAT
M=D

// THIS = *(endFrame-2)
@R14
D=M
@2
A=D-A
D=M
@THIS
M=D

// ARG = *(endFrame-3)
@R14
D=M
@3
A=D-A
D=M
@ARG
M=D

// LCL = *(endFrame-4)
@R14
D=M
@4
A=D-A
D=M
@LCL
M=D

// goto retAddr
@R15
A=M
0;JMP
//function Class1.get
(Class1.get)
//push static 0
@Class1.0
D=M
@SP
A=M
M=D
@SP
M=M+1
//push static 1
@Class1.1
D=M
@SP
A=M
M=D
@SP
M=M+1
//sub: pop y, pop x, push (x-y)
@SP
M=M-1
@SP
A=M
D=M
@SP
M=M-1
@SP
A=M
D=M-D
M=D
@SP
M=M+1
// return
@LCL
D=M
@R14
M=D              // endFrame = LCL

@R14
D=M
@5
A=D-A
D=M
@R15
M=D              // retAddr = *(endFrame-5)

// *ARG = pop()
@SP
AM=M-1
D=M
@ARG
A=M
M=D

// SP = ARG + 1
@ARG
D=M+1
@SP
M=D

// THAT = *(endFrame-1)
@R14
D=M
@1
A=D-A
D=M
@THAT
M=D

// THIS = *(endFrame-2)
@R14
D=M
@2
A=D-A
D=M
@THIS
M=D

// ARG = *(endFrame-3)
@R14
D=M
@3
A=D-A
D=M
@ARG
M=D

// LCL = *(endFrame-4)
@R14
D=M
@4
A=D-A
D=M
@LCL
M=D

// goto retAddr
@R15
A=M
0;JMP

//function Class2.set
(Class2.set)
// push argument 0
@0
D=A
@ARG
D=D+M
@R13
M=D
@R13
A=M
D=M
@SP
A=M
M=D
@SP
M=M+1
//pop static 0
@SP
M=M-1
@SP
A=M
D=M
@Class2.0
M=D
// push argument 1
@1
D=A
@ARG
D=D+M
@R13
M=D
@R13
A=M
D=M
@SP
A=M
M=D
@SP
M=M+1
//pop static 1
@SP
M=M-1
@SP
A=M
D=M
@Class2.1
M=D
// push 0
@0
D=A
@SP
A=M
M=D
@SP
M=M+1
    // return
@LCL
D=M
@R14
M=D              // endFrame = LCL

@R14
D=M
@5
A=D-A
D=M
@R15
M=D              // retAddr = *(endFrame-5)

// *ARG = pop()
@SP
AM=M-1
D=M
@ARG
A=M
M=D

// SP = ARG + 1
@ARG
D=M+1
@SP
M=D

// THAT = *(endFrame-1)
@R14
D=M
@1
A=D-A
D=M
@THAT
M=D

// THIS = *(endFrame-2)
@R14
D=M
@2
A=D-A
D=M
@THIS
M=D

// ARG = *(endFrame-3)
@R14
D=M
@3
A=D-A
D=M
@ARG
M=D

// LCL = *(endFrame-4)
@R14
D=M
@4
A=D-A
D=M
@LCL
M=D

// goto retAddr
@R15
A=M
0;JMP
//function Class2.get
(Class2.get)
//push static 0
@Class2.0
D=M
@SP
A=M
M=D
@SP
M=M+1
//push static 1
@Class2.1
D=M
@SP
A=M
M=D
@SP
M=M+1
//sub: pop y, pop x, push (x-y)
@SP
M=M-1
@SP
A=M
D=M
@SP
M=M-1
@SP
A=M
D=M-D
M=D
@SP
M=M+1
// return
@LCL
D=M
@R14
M=D              // endFrame = LCL

@R14
D=M
@5
A=D-A
D=M
@R15
M=D              // retAddr = *(endFrame-5)

// *ARG = pop()
@SP
AM=M-1
D=M
@ARG
A=M
M=D

// SP = ARG + 1
@ARG
D=M+1
@SP
M=D

// THAT = *(endFrame-1)
@R14
D=M
@1
A=D-A
D=M
@THAT
M=D

// THIS = *(endFrame-2)
@R14
D=M
@2
A=D-A
D=M
@THIS
M=D

// ARG = *(endFrame-3)
@R14
D=M
@3
A=D-A
D=M
@ARG
M=D

// LCL = *(endFrame-4)
@R14
D=M
@4
A=D-A
D=M
@LCL
M=D

// goto retAddr
@R15
A=M
0;JMP
