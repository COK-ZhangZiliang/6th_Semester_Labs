ifneq ($(KERNELRELEASE),)
	obj-m := cpu_loadavg.o
else
	KERNELDIR ?= /root/kernel
	PWD := $(shell pwd)
default:
	$(MAKE) -C $(KERNELDIR) M=$(PWD) modules
endif
.PHONY:clean
clean:
	-rm *.mod.c *.o *.order *.symvers *.ko
