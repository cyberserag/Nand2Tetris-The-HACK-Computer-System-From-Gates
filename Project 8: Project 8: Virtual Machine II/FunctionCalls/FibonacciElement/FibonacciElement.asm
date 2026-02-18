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
// push 4
@4
D=A
@SP
A=M
M=D
@SP
M=M+1
    //call Main.fibonacci
@Main.fibonacci$ret.1
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
@1
D=D-A
@ARG
M=D
//Reposition LCL=SP
@SP
D=M
@LCL
M=D
//goto function
@Main.fibonacci
0;JMP
//return label 
(Main.fibonacci$ret.1)
//generating (END)
(Sys.init$END)
//goto END
@Sys.init$END
0;JMP
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

//function Main.fibonacci
(Main.fibonacci)
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
// push 2
@2
D=A
@SP
A=M
M=D
@SP
M=M+1
    //lt: pop y, pop x, push (-1 if x<y else 0)
@SP
M=M-1
A=M
D=M
@SP
M=M-1
A=M
D=M-D
@LT_TRUE_1
D;JLT
@SP
A=M
M=0
@LT_END_1
0;JMP
(LT_TRUE_1)
@SP
A=M
M=-1
(LT_END_1)
@SP
M=M+1
//if-goto N_LT_2
@SP
AM=M-1
D=M
@Main.fibonacci$N_LT_2
D;JNE
//goto N_GE_2
@Main.fibonacci$N_GE_2
0;JMP
//generating (N_LT_2)
(Main.fibonacci$N_LT_2)
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
//generating (N_GE_2)
(Main.fibonacci$N_GE_2)
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
// push 2
@2
D=A
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
//call Main.fibonacci
@Main.fibonacci$ret.2
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
@1
D=D-A
@ARG
M=D
//Reposition LCL=SP
@SP
D=M
@LCL
M=D
//goto function
@Main.fibonacci
0;JMP
//return label 
(Main.fibonacci$ret.2)
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
// push 1
@1
D=A
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
//call Main.fibonacci
@Main.fibonacci$ret.3
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
@1
D=D-A
@ARG
M=D
//Reposition LCL=SP
@SP
D=M
@LCL
M=D
//goto function
@Main.fibonacci
0;JMP
//return label 
(Main.fibonacci$ret.3)
//add: pop y, pop x, push x+y
@SP
M=M-1
@SP
A=M
D=M
@SP
M=M-1
@SP
A=M
D=D+M
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
