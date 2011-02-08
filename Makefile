# install locations
PREFIX?=/usr/local
LIBDIR=$(PREFIX)/lib
MANDIR=$(PREFIX)/man/man1

# build info
CC?=/usr/bin/cc
CFLAGS+=-c -std=c89 -Wall -Wextra $(CDEBUG)
LDFLAGS+=

OBJS=str2argv.o

# main targets

.PHONY: debug clean install uninstall publish-repos man-debug

test_str2argv:	$(OBJS)
	$(CC) $(CFLAGS) -Dstr2argv_test_main=main -o test_str2argv.o str2argv.c
	$(CC) $(LDFLAGS) -o $@ test_str2argv.o

.c.o:
	$(CC) $(CFLAGS) $<

debug:
	make CDEBUG="-DDEBUG -g"

clean:
	rm -f $(OBJS)
	rm -f test_str2argv


