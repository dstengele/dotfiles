#include <stdlib.h>
#include <stdio.h>
#include <time.h>

#define DAY (time_t)86400
#define YEAR (time_t)31556926

int main(int argc, const char *argv[]) {
    time_t current_time;
    time_t message_time;

    const char *old, *recent, *today;
    const char *format;

    current_time = time(NULL);

    if (argc!=6) {
        printf("Usage: %s old recent today format timestamp\n", argv[0]);
        return 2;
    }

    old = argv[1];
    recent = argv[2];
    today = argv[3];

    format = argv[4];

    message_time = atoi(argv[5]);

    if ((message_time/YEAR) < (current_time/YEAR)) {
        printf(format, old);
    } else if ((message_time/DAY) < (current_time/DAY)) {
        printf(format, recent);
    } else {
        printf(format, today);
    }

    return 0;
}
