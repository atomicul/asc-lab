CXXFLAGS ?= -g

CXXFLAGS := $(CXXFLAGS) -m32

.SUFFIXES:

%.o: %.s
	$(CC) -c $(CXXFLAGS) -o $@ $<

%.o: %.c
	$(CC) -c $(CXXFLAGS) $(CFLAGS) -o $@ $<

main: main.o mycpy.o
	$(CC) $(CXXFLAGS) -o $@ main.o mycpy.o
	rm main.o mycpy.o

.PHONY: all
all: main mycpy

.PHONY: clean
clean:
	rm -f main *.o
