CC = g++
CFLAGS = -std=c++11 -Wall
TARGET = longest_words

all: $(TARGET)

$(TARGET): main.o
	$(CC) $(CFLAGS) -o $(TARGET) main.o

main.o: main.cpp
	$(CC) $(CFLAGS) -c main.cpp

clean:
	rm -f *.o $(TARGET)
