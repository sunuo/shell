test:   anotherTest.o DoMe test.o foo.o
	cc -Wall test.o anotherTest.o -o test
test.o: test.h
include subMake
foo.o:
	cd subdir&&$(make)
	echo $(make)
clean:
	rm -rf *.o test
