CFLAGS = -g -m32

OBJS = box.o builtin.o button.o display.o graph.o main.o \
 msg.o parse.o prompt.o pulldown.o queue.o quiz.o scan.o \
 simplify.o sym.o unparse.o work.o xjunk.o

quiz: $(OBJS)
	cc -o quiz -m32 $(OBJS) -lX11 -lm

clean:
	rm -f $(OBJS) *~
