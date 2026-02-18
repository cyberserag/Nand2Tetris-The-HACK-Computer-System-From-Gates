file=open(r"D:\learn\CSS\Pong.asm", "r") 
newfile=open(r"D:\learn\CSS\newfile.txt", "w") 

lines = file.readlines()

for line in lines:
        line= line.split("//")[0]
        line=line.replace("\t", "")
        line=line.replace(" ", "")
        line = line.rstrip()

        if line.strip():   
            newfile.write(line+"\n")
