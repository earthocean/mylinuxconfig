#include<stdio.h>
int add(int a, int b);
int main()
{
    int a=0,b=1;
    add(a,b);
    printf("hello world");
}

int add(int a, int b)
{
    return a + b;
}

