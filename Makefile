dirs:
	@mkdir -p obj
	@mkdir -p bin
	@mkdir -p tests/bin
	@mkdir -p reports/tests

all: dirs cppcheck bin doc cppcheck

bin: dirs obj/main.o obj/stack.o obj/armstrong.o
	gcc obj/main.o obj/stack.o obj/armstrong.o -Wall -o bin/is_armstrong_number -lm

obj/main.o : main.c
	gcc -c -pedantic -Wall main.c -o obj/main.o

obj/stack.o : stack.c
	gcc -c -pedantic -Wall stack.c -o obj/stack.o

obj/armstrong.o : armstrong.c
	gcc -c -pedantic -Wall armstrong.c -o obj/armstrong.o

clean:
	@rm -fR bin/* obj/* tests/bin/* reports/tests/*

doc:
	doxygen

clean-doc:
	rm -fR html latex

cppcheck-xml:
	cppcheck --enable=all --inconclusive --xml --xml-version=2 main.c stack.c armstrong.c 2> cppcheck.xml

cppcheck:
	cppcheck --enable=all --inconclusive main.c stack.c armstrong.c

tests: obj/armstrong.o obj/stack.o
	gcc ./tests/test_is_armstrong_number.c obj/armstrong.o obj/stack.o -lm -lcmocka -o tests/bin/test_is_armstrong_number 
	CMOCKA_MESSAGE_OUTPUT=stdout CMOCKA_XML_FILE='' ./tests/bin/test_is_armstrong_number || true

tests-xml: obj/armstrong.o obj/stack.o
	gcc ./tests/test_is_armstrong_number.c obj/armstrong.o obj/stack.o -lm -lcmocka -o tests/bin/test_is_armstrong_number 
	CMOCKA_XML_FILE=reports/tests/%g.xml CMOCKA_MESSAGE_OUTPUT=xml ./tests/bin/test_is_armstrong_number || true
