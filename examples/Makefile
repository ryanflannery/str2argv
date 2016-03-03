CFLAGS  =-c -std=c89 -Wall -Wextra -I../include
LDFLAGS =-L../lib -lstr2argv

interactive: interactive.o
	$(CC) -o $@ interactive.o $(LDFLAGS)

.c.o:
	$(CC) $(CFLAGS) $<

clean:
	rm -f interactive interactive.o
