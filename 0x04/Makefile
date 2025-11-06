CXXFLAGS ?= -g

CXXFLAGS := $(CXXFLAGS) -m32

.SUFFIXES:

%: %.s
	$(CC) $(CXXFLAGS) $(CFLAGS) -o $@ $<

.PHONY: all
all: fact fib fib_memo

.PHONY: clean
clean:
	rm -f fact fib fib_memo
