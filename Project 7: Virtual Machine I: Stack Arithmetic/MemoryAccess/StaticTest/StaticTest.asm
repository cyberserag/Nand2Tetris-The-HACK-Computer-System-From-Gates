// push 111
@111
D=A
@SP
A=M
M=D
@SP
M=M+1
    // push 333
@333
D=A
@SP
A=M
M=D
@SP
M=M+1
    // push 888
@888
D=A
@SP
A=M
M=D
@SP
M=M+1
    //pop static 8
@SP
M=M-1
@SP
A=M
D=M
@newfile.8
M=D
//pop static 3
@SP
M=M-1
@SP
A=M
D=M
@newfile.3
M=D
//pop static 1
@SP
M=M-1
@SP
A=M
D=M
@newfile.1
M=D
//push static 3
@newfile.3
D=M
@SP
A=M
M=D
@SP
M=M+1
//push static 1
@newfile.1
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
//push static 8
@newfile.8
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
