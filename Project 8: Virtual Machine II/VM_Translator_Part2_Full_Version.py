from math import *

newfile=open(r"D:\learn\CSS\Class2.vm", "r") 
filename="Class2"
TRfile=open(r"D:\learn\CSS\translated.asm", "w") 


symbol_table={
      "R0": 0,"R1": 1,"R2": 2,"R3": 3,"R4": 4,"R5": 5,"R6": 6,"R7": 7,"R8": 8,"R9": 9,"R10": 10,
      "R11": 11,"R12": 12,"R13": 13,"R14": 14,"R15": 15,"SCREEN":16384,"KBD":24576,
      "SP":0, "LCL":1,"ARG":2, "THIS":3, "THAT":4                              
      }
SEGMENT_BASE={
     "local":"LCL",
      "argument": "ARG",
      "this": "THIS",
      "that": "THAT"
}

def write_push_constant(value):
    return f"""// push {value}
@{value}
D=A
@SP
A=M
M=D
@SP
M=M+1
    """
def write_pop_segment(segment , index):
   base = SEGMENT_BASE[segment]
   return f"""//pop {segment} {index}
@{index}
D=A
@{base}
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
"""
def write_push_segment(segment , index):
   base = SEGMENT_BASE[segment]
   return f"""// push {segment} {index}
@{index}
D=A
@{base}
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
"""
def write_pop_static(filename,index):
   return f"""//pop static {index}
@SP
M=M-1
@SP
A=M
D=M
@{filename}.{index}
M=D
"""
def write_push_static(filename,index):
   return f"""//push static {index}
@{filename}.{index}
D=M
@SP
A=M
M=D
@SP
M=M+1
"""
def write_push_temp(index):
   address= 5+index
   return f"""//push temp {index}
@R{address}
D=M
@SP
A=M
M=D
@SP
M=M+1
"""
def write_pop_temp(index):
   address= 5+index
   return f"""//pop temp {index}
@SP
M=M-1
@SP
A=M
D=M
@R{address}
M=D
"""
def write_push_pointer(index):
   if index==0:
      segment="THIS"
   elif index==1:
      segment="THAT"
   else:
      raise ValueError("Pointer index must be 0 or 1")

   return f"""//push pointer {index}
@{segment}
D=M
@SP
A=M
M=D
@SP
M=M+1
"""   
def write_pop_pointer(index):
   if index==0:
      segment="THIS"
   elif index==1:
      segment="THAT"
   else:
      raise ValueError("Pointer index must be 0 or 1")

   return f"""//pop pointer {index}
@SP
M=M-1
@SP
A=M
D=M
@{segment}
M=D
"""   
def write_add():
   return f"""//add: pop y, pop x, push x+y
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
"""
def write_sub():
   return f"""//sub: pop y, pop x, push (x-y)
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
"""
def write_neg():
   return f"""//neg: pop y, push (-y)
@SP
A=M-1
M=-M
"""
def write_not():
   return f"""//not: pop y, push (!y)
@SP
A=M-1
M=!M
"""
def write_and():
   return f"""//and: pop y, push (x&y)
@SP
AM=M-1
D=M
A=A-1
M=D&M
"""
def write_or():
   return f"""//or: pop y, push (x|y)
@SP
AM=M-1
D=M
A=A-1
M=D|M
"""
label_counter = 0

def write_eq():
    global label_counter
    label_true = f"EQ_TRUE_{label_counter}"
    label_end = f"EQ_END_{label_counter}"
    label_counter += 1

    return f"""//eq: pop y, pop x, push (-1 if x=y else 0)
@SP
M=M-1
A=M
D=M
@SP
M=M-1
A=M
D=M-D
@{label_true}
D;JEQ
@SP
A=M
M=0
@{label_end}
0;JMP
({label_true})
@SP
A=M
M=-1
({label_end})
@SP
M=M+1
"""
def write_gt():
    global label_counter
    label_true = f"GT_TRUE_{label_counter}"
    label_end = f"GT_END_{label_counter}"
    label_counter += 1

    return f"""//gt: pop y, pop x, push (-1 if x>y else 0)
@SP
M=M-1
A=M
D=M
@SP
M=M-1
A=M
D=M-D
@{label_true}
D;JGT
@SP
A=M
M=0
@{label_end}
0;JMP
({label_true})
@SP
A=M
M=-1
({label_end})
@SP
M=M+1
"""
def write_lt():
    global label_counter
    label_true = f"LT_TRUE_{label_counter}"
    label_end = f"LT_END_{label_counter}"
    label_counter += 1

    return f"""//lt: pop y, pop x, push (-1 if x<y else 0)
@SP
M=M-1
A=M
D=M
@SP
M=M-1
A=M
D=M-D
@{label_true}
D;JLT
@SP
A=M
M=0
@{label_end}
0;JMP
({label_true})
@SP
A=M
M=-1
({label_end})
@SP
M=M+1
"""
current_function = ""
def write_goto(label):
   if current_function:
         full_label=f"{current_function}${label}"
   else:
         full_label= label   

   return f"""//goto {label}
@{full_label}
0;JMP
"""
def write_ifgoto(label):
   if current_function:
         full_label=f"{current_function}${label}"
   else:
         full_label= label   

   return f"""//if-goto {label}
@SP
AM=M-1
D=M
@{full_label}
D;JNE
"""
def write_label(label):
      if current_function:
         full_label=f"{current_function}${label}"
      else:
         full_label= label   

      return f"""//generating ({label})
({full_label})
"""
def write_function_label(current_fun):
   return f"""//function {current_fun}
({current_fun})
"""
def write_push_0():
   return """@SP
A=M
M=0
@SP
M=M+1
"""

def write_call_function(func_name,nArgs):
   global label_counter
   return_label=f"{func_name}$ret.{label_counter}"
   label_counter+=1   
   return f"""//call {func_name}
@{return_label}
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
@{nArgs}
D=D-A
@ARG
M=D
//Reposition LCL=SP
@SP
D=M
@LCL
M=D
//goto function
@{func_name}
0;JMP
//return label 
({return_label})
"""
def write_return():
    return """// return
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
"""

def write_bootstrap():
    asm = "// bootstrap code\n"
    
    # SP = 256
    asm += "@256\n"
    asm += "D=A\n"
    asm += "@SP\n"
    asm += "M=D\n"
    
    # call Sys.init , 0
    asm += write_call_function("Sys.init", 0)
    
    return asm
TRfile.write(write_bootstrap())

lines=newfile.readlines()
for line in lines:
   asm=""
   line = line.strip()

   if not line or line.startswith("//"):
      continue
   parts=line.split()
   cmd= parts[0]
   if cmd == "push":
      seg= parts[1]
      index= int(parts[2])
      if seg== "temp":
         asm= write_push_temp(index)
      elif seg=="pointer":
         asm= write_push_pointer(index)   
      elif seg=="static":
         asm= write_push_static(filename,index)
      elif seg=="constant":
         asm= write_push_constant(index)    
      else:
         asm= write_push_segment(seg,index)
   elif cmd == "pop":
      seg= parts[1]
      index= int(parts[2])
      if seg== "temp":
         asm= write_pop_temp(index)
      elif seg=="pointer":
         asm= write_pop_pointer(index)   
      elif seg=="static":
         asm= write_pop_static(filename,index)  
      else:
         asm= write_pop_segment(seg,index)   
   elif cmd in ["add","sub","or","and","not","neg","eq","gt","lt"]:
      asm= globals()[f"write_{cmd}"]()                    
   elif cmd == "goto":
      LABEL= parts[1]
      asm=write_goto(LABEL)
   elif cmd == "if-goto":
      LABEL= parts[1]
      asm=write_ifgoto(LABEL)
   elif cmd == "label":
      LABEL= parts[1]
      asm=write_label(LABEL)
   elif cmd == "function":
      current_function=parts[1]
      nVars=int(parts[2])
      asm = write_function_label(current_function)
      for _ in range(nVars):
          asm += write_push_0()
   elif cmd == "call":
      func_name=parts[1]
      nArgs=int(parts[2])
      asm=write_call_function(func_name,nArgs)
   elif cmd == "return":
      asm=write_return()   

   TRfile.writelines(asm)

