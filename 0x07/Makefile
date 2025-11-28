CXXFLAGS ?= -g

CXXFLAGS := $(CXXFLAGS) -m32

.SUFFIXES:

%: %.s
	$(CC) $(CXXFLAGS) $(CFLAGS) -o $@ $<

.PHONY: all
all: main harmonic_mean

.PHONY: clean
clean:
	rm -f main harmonic_mean
