/*
 * This is free and unencumbered public domain software.
 * For more information see http://unlicense.org/.
 *
 * @author Hans-Harro Horn <h.h.horn@gmail.com> (hhhorn.de)
 */

#define _XOPEN_SOURCE
#include <stdio.h>
#include <stdlib.h>
#include <unistd.h>
#include <string.h>
#include <time.h>
#include <X11/Xlib.h>

static Display *dpy;

void setstatus(char *str) {
    XStoreName(dpy, DefaultRootWindow(dpy), str);
    XSync(dpy, False);
}

int pamixer() {
    FILE *fd;
    int valstring;

    fd = popen("/usr/bin/pamixer --get-volume", "r");
    
    fscanf(fd, "%d", &valstring);
    int val = valstring + 0;
    fclose(fd);
    return val;
}

int getdatetime(char *status, size_t size) {
    time_t result;
    struct tm *resulttm;

    result = time(NULL);
    resulttm = localtime(&result);

    return strftime(status, size, "%b %d %H:%M", resulttm);
}

int getvol(char* status, size_t size) {
    int vol;

    vol = pamixer();

    if(vol == 0) {
        return snprintf(status, size, " \ue909 %d%% | ", vol);
    } else if(vol <= 33) {
        return snprintf(status, size, " \ue999 %d%% | ", vol);
    } else if (vol <= 66) {
	return snprintf(status, size, " \ue900 %d%% | ", vol);
    } else {
        return snprintf(status, size, " \ue90a %d%% | ", vol);	
    }
}

int main(void) {
    char status[100];
    int l = 0;

    if (!(dpy = XOpenDisplay(NULL))) {
        fprintf(stderr, "Cannot open display.\n");
        return 1;
    }

    for (;;sleep(2)) {
        l = getvol(status, sizeof(status) - l);
        l += getdatetime(status + l, sizeof(status) - l);

        setstatus(status);
    }

    free(status);
    XCloseDisplay(dpy);

    return 0;
}

