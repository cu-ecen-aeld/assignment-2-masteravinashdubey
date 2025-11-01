CC = $(CROSS_COMPILE)gcc
CFLAGS = -Wall -Werror
TARGET = writer
OBJS = writer.o
#SRC = writer.c

all: $(TARGET)

$(TARGET): $(OBJS)
	$(CC) $(CFLAGS) -o $(TARGET) $(OBJS)

%.o: %.c
	$(CC) $(CFLAGS) -c $< -o $@

clean:
	rm -f $(TARGET) $(OBJS)