CXXFLAGS ?= -g

CXXFLAGS := $(CXXFLAGS) -m32

.SUFFIXES:

%: %.s
	$(CC) $(CXXFLAGS) $(CFLAGS) -o $@ $<

.PHONY: all
all: main reverse sort

.PHONY: clean
clean:
	rm -f main reverse sort
