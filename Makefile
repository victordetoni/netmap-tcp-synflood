# For multiple programs using a single source file each,
# we can just define 'progs' and create custom targets.
PROGS	=	pkt-gen bridge vale-ctl pkt-gen-b bridge-b pkt-gen3
#PROGS += pingd
PROGS	+= testlock test_select testmmap vale-ctl
MORE_PROGS = kern_test

CLEANFILES = $(PROGS) *.o
NO_MAN=
CFLAGS = -O2 -pipe
CFLAGS += -Werror -Wall -Wunused-function
CFLAGS += -I ../../sys # -I/home/luigi/FreeBSD/head/sys -I../sys
CFLAGS += -Wextra
.ifdef WITH_PCAP
LDFLAGS += -lpcap
.else
CFLAGS += -DNO_PCAP
.endif

LDFLAGS += -lpthread
LDFLAGS += -lrt	-lm # needed on linux, does not harm on BSD
#SRCS = pkt-gen.c

all: $(PROGS)

pkt-gen: pkt-gen.o
	$(CC) $(CFLAGS) -o pkt-gen pkt-gen.o $(LDFLAGS)

clean:
	-@rm -rf $(CLEANFILES)
