
test:  another.o  test.o
	gcc -Wall test.o another.o -o test

another.o: anotherTest.c 
	gcc -c -Wall anotherTest.c -o another.o 

test.o: test.c 
	gcc -c -Wall test.c 

clean: 
	rm -rf *.o test
