# Linux 2.6 Kernel Makefile
# New format.  All building is done within the kernel development
# tree.  The user's makefile no longer needs to specify all build rules
# and kernel defines.  Its all done by the kernel now.
#
# For full details on bulding a kernel module see:
# 
# To build with more verbose output run:
# 	$> make V=1 



ifneq ($(KERNELRELEASE),)

obj-m := lscpcie2.o

EXTRA_CFLAGS += -I.

else

KDIR := /lib/modules/$(shell uname -r)/build
PWD := $(shell pwd)

default :
	$(MAKE) -C $(KDIR) SUBDIRS=$(PWD) modules

clean :
	rm *.o *.ko *.mod.c
endif
