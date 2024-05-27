#include <cstdio>

int main()
{
    try
    {
        puts("throw...");
        throw 1;
        puts("(never reached)");
    }
    catch (...)
    {
        puts("catch!");
    }
    return 0;
}
