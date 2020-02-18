dirs:
	@mkdir -p obj
	@mkdir -p bin

all: dirs bin doc

bin: dirs obj/main.o 
	gcc obj/main.o -o bin/is_armstrong_number -lm

obj/main.o : main.c
	gcc -c main.c -o obj/main.o

clean:
	@rm -fR bin/* obj/* 

doc:
	doxygen

clean-doc:
	rm -fR html latex

