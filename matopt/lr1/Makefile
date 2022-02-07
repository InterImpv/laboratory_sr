CC := gcc
CFLAGS := -Wall -std=gnu18 -lm
OBJS := main.o

PROJ_NAME := main

all: $(PROJ_NAME)

.PHONY: clean

$(PROJ_NAME): $(OBJS)
	$(CC) $(CFLAGS) -o $@ $^
	
%.o: %.c $(DEPS)
	$(CC) $(CFLAGS) -c $<
	
clean:
	rm -f $(OBJS)
	
	
