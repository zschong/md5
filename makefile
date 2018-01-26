ARCH := powerpc-e300c3-linux-gnu-
ARCH := arm-linux-
ARCH := 
CC := $(ARCH)g++
AR := $(ARCH)ar
ARFLAG := -rc
STRIP := $(ARCH)strip
INCS := $(wildcard [a-y]*/*.h)
OBJS := $(patsubst %.c, %.o, $(wildcard [a-y]*/*.c))
OBJS += $(patsubst %.cpp, %.o, $(wildcard [a-y]*/*.cpp))
CFLAGS := $(patsubst %, -I%, $(shell find [a-y]* -type d))
LIB_TARGET := thislib.a
EXE_TARGET := md5.exe

all: $(EXE_TARGET)
	@echo -n "\033[33;4m"
	@echo "strip  {$+}"
	@echo -n "\33[0m\033[32m"
	@ls -1sh $+ $(LIB_TARGET)
	@echo -n "\033[0m"

md5.exe: ztest/test.cpp $(LIB_TARGET)
	@echo "$(CC) ztest/service_server.cpp => $@"
	@$(CC) $(CFLAGS) $+ -o $@
	@$(STRIP) $@
thislib.a:$(OBJS)
	@$(AR) $(ARFLAG) $@ $+

.c.o: $(INCS)
	@$(CC) $(CFLAGS) -c $*.c -o $@
	@echo '$(CC) $*.c => $@'
.cpp.o: $(INCS)
	@$(CC) $(CFLAGS) -c $*.cpp -o $@
	@echo '$(CC) $*.cpp => $@'

clean:
	@rm -rfv $(OBJS) $(EXE_TARGET) $(LIB_TARGET)
