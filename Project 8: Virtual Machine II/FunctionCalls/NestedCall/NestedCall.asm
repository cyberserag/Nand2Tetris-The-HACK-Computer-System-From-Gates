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
// push 4000
@4000
D=A
@SP
A=M
M=D
@SP
M=M+1
    //pop pointer 0
@SP
M=M-1
@SP
A=M
D=M
@THIS
M=D
// push 5000
@5000
D=A
@SP
A=M
M=D
@SP
M=M+1
    //pop pointer 1
@SP
M=M-1
@SP
A=M
D=M
@THAT
M=D
//call Sys.main
@Sys.main$ret.1
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
@Sys.main
0;JMP
//return label 
(Sys.main$ret.1)
//pop temp 1
@SP
M=M-1
@SP
A=M
D=M
@R6
M=D
//generating (LOOP)
(Sys.init$LOOP)
//goto LOOP
@Sys.init$LOOP
0;JMP
//function Sys.main
(Sys.main)
@SP
A=M
M=0
@SP
M=M+1
@SP
A=M
M=0
@SP
M=M+1
@SP
A=M
M=0
@SP
M=M+1
@SP
A=M
M=0
@SP
M=M+1
@SP
A=M
M=0
@SP
M=M+1
// push 4001
@4001
D=A
@SP
A=M
M=D
@SP
M=M+1
    //pop pointer 0
@SP
M=M-1
@SP
A=M
D=M
@THIS
M=D
// push 5001
@5001
D=A
@SP
A=M
M=D
@SP
M=M+1
    //pop pointer 1
@SP
M=M-1
@SP
A=M
D=M
@THAT
M=D
// push 200
@200
D=A
@SP
A=M
M=D
@SP
M=M+1
    //pop local 1
@1
D=A
@LCL
D=D+M
@R13
M=D
@SP
M=M-1
@SP
A=M
D=M
@R13
A=M
M=D
// push 40
@40
D=A
@SP
A=M
M=D
@SP
M=M+1
    //pop local 2
@2
D=A
@LCL
D=D+M
@R13
M=D
@SP
M=M-1
@SP
A=M
D=M
@R13
A=M
M=D
// push 6
@6
D=A
@SP
A=M
M=D
@SP
M=M+1
    //pop local 3
@3
D=A
@LCL
D=D+M
@R13
M=D
@SP
M=M-1
@SP
A=M
D=M
@R13
A=M
M=D
// push 123
@123
D=A
@SP
A=M
M=D
@SP
M=M+1
    //call Sys.add12
@Sys.add12$ret.2
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
@Sys.add12
0;JMP
//return label 
(Sys.add12$ret.2)
//pop temp 0
@SP
M=M-1
@SP
A=M
D=M
@R5
M=D
// push local 0
@0
D=A
@LCL
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
// push local 1
@1
D=A
@LCL
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
// push local 2
@2
D=A
@LCL
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
// push local 3
@3
D=A
@LCL
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
// push local 4
@4
D=A
@LCL
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
//function Sys.add12
(Sys.add12)
// push 4002
@4002
D=A
@SP
A=M
M=D
@SP
M=M+1
    //pop pointer 0
@SP
M=M-1
@SP
A=M
D=M
@THIS
M=D
// push 5002
@5002
D=A
@SP
A=M
M=D
@SP
M=M+1
    //pop pointer 1
@SP
M=M-1
@SP
A=M
D=M
@THAT
M=D
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
// push 12
@12
D=A
@SP
A=M
M=D
@SP
M=M+1
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