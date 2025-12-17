CXXFLAGS ?= -g

CXXFLAGS := $(CXXFLAGS) -m32

.SUFFIXES:

%.o: %.s
	$(CC) -c $(CXXFLAGS) -o $@ $<

main: main.o print_array.o merge_arrays.o merge_sort.o
	$(CC) $(CXXFLAGS) -o $@ main.o print_array.o merge_arrays.o merge_sort.o
	rm main.o print_array.o merge_arrays.o merge_sort.o

.PHONY: all
all: main

.PHONY: clean
clean:
	rm -f main *.o
