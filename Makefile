SHAREDOBJFILES := src/main.o src/tibasic.o src/tokens.o

.PHONY: all clean

CXXFLAGS := -g -Wall -pedantic -Werror

CXX := g++

all: tibasic

tibasic: objects src/tokens-orig.o
	g++ -o tibasic $(SHAREDOBJFILES) src/tokens-orig.o

tibasic-html: objects src/tokens-html.o
	g++ -o tibasic-html $(SHAREDOBJFILES) src/tokens-html.o

objects: $(SHAREDOBJFILES)

-include $(DEPFILES)

%.o: %.c
	@$(CXX) $(CFLAGS) -MMD -MP -c $< -o $@
