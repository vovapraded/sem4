#include <stdio.h>
#include "lib.h"

void f() {
    printf("f1\n");
    capture();
    printf("f2\n");
}
void  g() {
    printf("g1\n");
    splice();
    printf("g2\n");
}


int main(void)
{
    f();
    g();
    return 0;
}
