Introduction
------------

This is a small c utility library to convert between c-style strings and
argc/argv pairs.


Details
-------
There are three functions exported by this library.

1. The first converts a string (`str`) to an argc/argv pair:
```
    int str2argv(char *str, int *argc, char ***argv, const char **errmsg)
```
2. The second does the reverse: given an argc/argv pair, it returns a string.
```
    char * argv2str(int argc, char *argv[])
```
3. The third will free any argc/argv pair created by the above `str2argv`
   function.
```
    void argv_free(int *argc, char ***argv)
```

License
-------
The code is released under an ISC (2-clause BSD) style license.
