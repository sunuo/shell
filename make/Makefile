test:   anotherTest.o DoMe test.o
	cc -Wall test.o anotherTest.o -o test
test.o: test.h
include subMake
clean:
	rm -rf *.o test
