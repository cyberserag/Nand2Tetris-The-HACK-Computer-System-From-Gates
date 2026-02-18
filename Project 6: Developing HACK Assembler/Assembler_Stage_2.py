from math import *

newfile=open(r"D:\learn\CSS\newfile.txt", "r") 
binfile=open(r"D:\learn\CSS\binaryfile.hack", "w") 


symbol_table={
      "R0": 0,"R1": 1,"R2": 2,"R3": 3,"R4": 4,"R5": 5,"R6": 6,"R7": 7,"R8": 8,"R9": 9,"R10": 10,
      "R11": 11,"R12": 12,"R13": 13,"R14": 14,"R15": 15,"SCREEN":16384,"KBD":24576,
      "SP":0, "LCL":1,"ARG":2, "THIS":3, "THAT":4                              
      }

destDic={  "M": "001",
                      "D": "010",
                         "MD": "011",
                      "A": "100",
                      "AM": "101",
                     "AD": "110",
                      "AMD": "111" }
jmpDic={
      "JGT": "001",
      "JEQ": "010",
      "JGE": "011",
      "JLT": "100",
      "JNE": "101",
      "JLE": "110",
      "JMP": "111" }
compDic={
    "0":  "0101010",      
    "1":  "0111111",      
    "-1": "0111010",      
    "D":  "0001100",      
    "A":  "0110000",      
    "!D": "0001101",      
    "!A": "0110001",      
    "-D": "0001111",      
    "-A": "0110011",      
    "D+1":"0011111",      
    "A+1":"0110111",      
    "D-1":"0001110",      
    "A-1":"0110010",      
    "D+A":"0000010",      
    "D-A":"0010011",      
    "D&A":"0000000",      
    "D|A":"0010101",
    "M":  "1110000",
    "!M": "1110001",
    "-M": "1110011",
    "M+1":"1110111",
    "M-1":"1110010",
    "D+M":"1000010",
    "D-M":"1010011",
    "M-D":"1000111",
    "D&M":"1000000",
    "D|M":"1010101",

}
ROM_Address=0
Next_Var_Address=16
asmlines=newfile.readlines()

for inst in asmlines:
      inst = inst.strip()
      
      if inst.startswith("(") and inst.endswith(")"):
            label=inst[1:-1]
            symbol_table[label]=ROM_Address
      else:
            ROM_Address += 1    
for inst in asmlines:
      inst = inst.strip()
          
     #A-Instruction like @17 or @R2
      if inst.startswith("@"):
        symbol=inst[1:]
        if symbol.isdigit():
            value=int(inst.split("@")[1])
        elif symbol in symbol_table:
            value=symbol_table.get(symbol)
        else:
             symbol_table[symbol]=Next_Var_Address
             value=Next_Var_Address
             Next_Var_Address +=1
        pad_val=format(value,'016b')
        binfile.write(pad_val+"\n")
    
    #C-Instruction like M=D+1;JMP
      else:
            #ignore the line in which label declation exists so that we don't generate code for it.
            if inst.find("=") == -1 and inst.find(";") == -1:
                 continue

            if inst.find("=") == -1:
                  comp=inst.split(";")[0]
                  jmp=inst.split(";")[1]
                  destBits="000"
                  compBits=compDic.get(comp)
                  jmpBits=jmpDic.get(jmp)
                 
            elif inst.find(";") == -1:
                  dest=inst.split("=")[0]
                  comp=inst.split("=")[1]
                  jmpBits="000"
                  destBits=destDic.get(dest)
                  compBits=compDic.get(comp)

            else:
                  dest=inst.split("=")[0]
                  second_part=inst.split("=")[1]
                  comp=second_part.split(";")[0]
                  jmp=second_part.split(";")[1]
                  destBits=destDic.get(dest)
                  compBits=compDic.get(comp)
                  jmpBits=jmpDic.get(jmp)        
            
            C_InstructionBits= "111" + str(compBits) + str(destBits) + str(jmpBits)
            binfile.write(C_InstructionBits+"\n")


            

