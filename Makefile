dirs:
	@mkdir -p obj
	@mkdir -p bin

all: dirs cppcheck bin doc

bin: dirs obj/main.o 
	gcc obj/main.o -Wall -o bin/is_armstrong_number -lm

obj/main.o : main.c
	gcc -c -pedantic -Wall main.c -o obj/main.o

clean:
	@rm -fR bin/* obj/* 

doc:
	doxygen

clean-doc:
	rm -fR html latex

cppcheck:
	cppcheck --enable=all --inconclusive --xml --xml-version=2 main.c 2> cppcheck.xml
