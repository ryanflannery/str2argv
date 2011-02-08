# install locations
PREFIX?=/usr/local
LIBDIR=$(PREFIX)/lib
MANDIR=$(PREFIX)/man/man1

# build info
CC?=/usr/bin/cc
CFLAGS+=-c -std=c89 -Wall -Wextra $(CDEBUG)
LDFLAGS+=

OBJS=str2argv.o test.o

# main targets

.PHONY: debug clean install uninstall publish-repos man-debug

test:	$(OBJS)
	$(CC) -o $@ $(LDFLAGS) $(OBJS)

.c.o:
	$(CC) $(CFLAGS) $<

debug:
	make CDEBUG="-DDEBUG -g"

clean:
	rm -f $(OBJS)
	rm -f test


