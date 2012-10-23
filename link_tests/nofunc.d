
import std.stdio;

extern (C) void bad_func();

void main() {
    writeln("hello!");
    bad_func();
}

