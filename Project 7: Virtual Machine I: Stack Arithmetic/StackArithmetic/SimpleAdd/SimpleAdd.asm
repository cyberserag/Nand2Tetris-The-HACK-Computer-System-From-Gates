// push 7
@7
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