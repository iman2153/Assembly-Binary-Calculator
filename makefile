all:  binary
cmd:
	gcc  -Og -m32 -no-pie -o cmd test.s
binary:
	gcc -Og -m32 -no-pie -o bin binco.s
clean:
	rm -rf *cmd *bin
