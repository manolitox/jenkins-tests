dirs:
	@mkdir -p obj
	@mkdir -p bin

all: dirs cppcheck bin doc

bin: dirs obj/main.o obj/stack.o obj/armstrong.o
	gcc obj/main.o obj/stack.o obj/armstrong.o -Wall -o bin/is_armstrong_number -lm

obj/main.o : main.c
	gcc -c -pedantic -Wall main.c -o obj/main.o

obj/stack.o : stack.c
	gcc -c -pedantic -Wall stack.c -o obj/stack.o

obj/armstrong.o : armstrong.c
	gcc -c -pedantic -Wall armstrong.c -o obj/armstrong.o

clean:
	@rm -fR bin/* obj/* 

doc:
	doxygen

clean-doc:
	rm -fR html latex

cppcheck-xml:
	cppcheck --enable=all --inconclusive --xml --xml-version=2 main.c stack.c armstrong.c 2> cppcheck.xml

cppcheck:
	cppcheck --enable=all --inconclusive main.c stack.c armstrong.c
