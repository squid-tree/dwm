all: dwmstatus

dwmstatus: status.c
	gcc -Wall -pedantic -std=c99 -o dwmstatus status.c -lX11

install: all
	cp -f dwmstatus /usr/local/bin/dwmstatus
	chmod 755 /usr/local/bin/dwmstatus
clean:
	rm dwmstatus
