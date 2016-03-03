# install locations
PREFIX ?= /usr/local
INCDIR = $(PREFIX)/include
LIBDIR = $(PREFIX)/lib

# build info
CC		 	?=/usr/bin/cc
CFLAGS	+=-c -std=c89 -Wall -Wextra

HEADER=include/str2argv.h
SRC=src/str2argv.c
OBJ=str2argv.o
LIB=lib/libstr2argv.a

.PHONY: clean install uninstall

$(LIB): $(SRC) $(HEADER)
	mkdir -p lib
	$(CC) $(CFLAGS) -o $(OBJ) $(SRC)
	ar rcs $(LIB) $(OBJ)

clean:
	rm -f $(OBJ)
	rm -f $(LIB)
	rm -f test

install: $(LIB)
	install -c -m 0444 $(HEADER) $(INCDIR)
	install -c -m 0444 $(LIB) $(LIBDIR)

uninstall:
	rm -f $(INCDIR)/$(HEADER)
	rm -f $(LIBDIR)/$(LIB)

### unit tests (using gtest)

CXX 			 ?= clang++
TEST_CFLAGS  = -I/usr/local/include
TEST_LDFLAGS = -L/usr/local/lib -lgtest_main
TEST_SOURCES = src/str2argv.t.cc

test: src/str2argv.t.cc
	$(CXX) $(TEST_CFLAGS) $(TEST_LDFLAGS) -o $@ $(TEST_SOURCES)
	./test
