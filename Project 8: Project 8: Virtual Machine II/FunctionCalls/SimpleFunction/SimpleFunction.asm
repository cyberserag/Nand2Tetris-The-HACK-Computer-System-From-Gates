//function SimpleFunction.test
(SimpleFunction.test)
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
//not: pop y, push (!y)
@SP
A=M-1
M=!M
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
//endFrame=R14=LCL     endframe is temporary variable
@LCL
D=M
@R14
M=D
//retAddr = R15 = *(endFrame-5)    gets the return Address for the caller
@5
D=D-A
A=D
D=M
@R15
M=D
// *ARG = pop()  Reposition the return value for the caller
@SP
M=M-1
A=M
D=M
@ARG
A=M
M=D
//SP = ARG+1    Reposition SP for the Caller
@ARG
D=M+1
@SP
M=D
//THAT= *(endFrame-1)   Restores the saved THAT for the Caller
@R14
D=M-1
A=D
D=M
@THAT
M=D
//THIS= *(endFrame-2)   Restores the saved THIS for the Caller
@R14
D=M
@2
D=D-A
A=D
D=M
@THIS
M=D
//ARG= *(endFrame-3)   Restores the saved ARG for the Caller
@R14
D=M
@3
D=D-A
A=D
D=M
@ARG
M=D
//LCL= *(endFrame-4)   Restores the saved LCL for the Caller
@R14
D=M
@4
D=D-A
A=D
D=M
@LCL
M=D
// goto retAddr (saved temporary in R15)
@R15
A=M
0;JMP
