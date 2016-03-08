Introduction
------------

[![License: ISC](https://img.shields.io/badge/license-ISC-blue.svg "License: ISC")](LICENSE)
[![Build Status](https://travis-ci.org/ryanflannery/str2argv.svg?branch=master)](https://travis-ci.org/ryanflannery/str2argv)


This is a small portable C (strict C89) library to convert between c-style
strings and argc/argv pairs. It handles escaping spaces, tabs, etc. Useful if
you have an application that has shell-like features, where it takes input
strings/commands from users and runs functions/plugins/etc.


Details
-------
There are two main functions exported by this lib.

The first is to convert a string to an argc/argv pair:
```
    int
    str2argv(char *str, int *argc, char ***argv, const char **errmsg)
```
The resulting argv can be `free()`d using
```
    void argv_free(int *argc, char ***argv)
```

The second function does the reverse: given an argc/argv pair, it returns a
string.
```
    char*
    argv2str(int argc, char *argv[])
```

Install
-------
Edit the variables in `Makefile` for where to install the .h and the lib.
Then
```
   $ ./configure
   $ make
   $ make install
   $ make test          /* run gtests */
```

License
-------
The code is released under an ISC (2-clause BSD) style license.
