
This project contains utilities for working on the D programming language.
To install, place dmd, phobos, druntime as subdirectories here. To build
everything, just execute the command:

    $ sh posix/gen.sh
    
I might add support for windows if I need it.

So it doesn't mess up your installed stable `dmd`, the testing output will be
moved to `./wbd`. You guess the acronym (hint: MRI).

Everything is released under the GPLv3.

Options
-------
You can specify what item specifically to build as a parameter to `gen.sh`.

