ASFLAGS ?= -g
LDFLAGS ?= -g

ASFLAGS := $(ASFLAGS)
LDFLAGS := $(LDFLAGS) -e_start

.SUFFIXES:

%: %.o
	$(LD) $(LDFLAGS) -o $@ $<

%.o: %.s
	$(AS) $(ASFLAGS) -o $@ $<

.PHONY: all
all: main array

.PHONY: clean
clean:
	rm -f *.o
	rm -f main array
