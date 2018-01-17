
test:  anotherTest.o  test.o
	gcc -Wall test.o anotherTest.o -o test

anotherTest.o: anotherTest.c 
	gcc -c -Wall anotherTest.c 

test.o: test.c 
	gcc -c -Wall test.c 

clean: 
	rm -rf *.o test
