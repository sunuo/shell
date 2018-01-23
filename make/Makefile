VPATH = ./subdir
test:   anotherTest.o DoMe foo.o test.o
	cc -Wall -Lsubdir test.o anotherTest.o -lfoo.o -o test
test.o: test.h
	cc -c -Isubdir test.c -o test.o
include subMake
foo.o:
	echo 'start make foo'
	cd subdir&&$(MAKE)
	echo $(VPATH)
clean:
	rm -rf *.o test
