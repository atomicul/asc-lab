CXXFLAGS ?= -g

CXXFLAGS := $(CXXFLAGS) -m32

.SUFFIXES:

%: %.s
	$(CC) $(CXXFLAGS) $(CFLAGS) -o $@ $<

.PHONY: all
all: main

.PHONY: clean
clean:
	rm -f main
