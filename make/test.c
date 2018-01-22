#include<stdio.h>
#include "test.h"
#include "foo.h"
int main()
{
   printf("hello world!  %s\n",WEL_TARGET);
   fooMe();
   getchar();
   return 0;
}
