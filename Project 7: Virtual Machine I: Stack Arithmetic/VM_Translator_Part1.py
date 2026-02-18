from math import *

newfile=open(r"D:\learn\CSS\StackTest.vm", "r") 
filename="newfile"
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

lines=newfile.readlines()
for line in lines:
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
   if cmd == "pop":
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
   if cmd in ["add","sub","or","and","not","neg","eq","gt","lt"]:
      asm= globals()[f"write_{cmd}"]()                    
   TRfile.writelines(asm)

