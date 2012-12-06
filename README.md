
`dlang-workspace` contains the basic configurations for hacking on your own
fork of `dmd`, `druntime`, and `phobos` on nix systems, while not conflicting
with your installed stable version.

To install:
    
    $ git clone git://github.com/carlor/dlang-workspace.git dlang
    $ cd dlang/
    $ git clone <dmd,      the central repo or your fork>
    $ git clone <druntime, the central repo or your fork>
    $ git clone <phobos,   the central repo or your fork>

Now, you can run the `posix/gen.sh` script to build all repositories. You can
specify what item specifically to build (`dmd`, `phobos`, or `druntime`) as a
parameter to `gen.sh`.

It makes an executable which links to your fork of druntime/phobos called `wbd`.
You guess the acronym (hint: MRI).

You can specify what item specifically to build (`dmd`, `phobos`, or `druntime`)
as a parameter to `gen.sh`.

Everything applicable is released under the GPLv3.

Platform Support
----------------
This has been tested on OSX, Debian, and Ubuntu, and works without a standard
install of the D system.

It doesn't work on Windows; pull requests to add support for that, or anything
else, are appreciated.

