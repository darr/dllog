tempPath = ./temp/

objPath = ./temp/obj/
objects = $(objPath)main.o $(objPath)dllog.o $(objPath)testdllog.o

basePath = .
runPath = ./

CC = gcc
CPPFLAGS = -g -o
CFLAGS = -g -c
APP_NAME = dllog.exe

checkDir: clear checkTempDir checkObjDir $(APP_NAME)
$(APP_NAME): $(objects)
	$(CC) $(CPPFLAGS) $(tempPath)$@ $^

checkTempDir:
	test -d $(tempPath)|| mkdir -p $(tempPath)
checkObjDir:
	test -d $(objPath)|| mkdir -p $(objPath)

$(objPath)main.o:$(runPath)main.c
	$(CC) $(CFLAGS) $^ -o $@

$(objPath)%.o:$(basePath)*/%.c
	$(CC) $(CFLAGS) $^ -o $@

clean:
	rm $(objects) $(tempPath)$(APP_NAME)
clear:
	rm -rf $(tempPath)


