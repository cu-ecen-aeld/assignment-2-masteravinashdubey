#include <stdio.h>
#include <stdlib.h>
#include <syslog.h>
#include <fcntl.h>
#include <unistd.h>
#include <string.h>
#include <errno.h>

int main(int argc, char *argv[]) {
    if (argc != 3) {
        syslog(LOG_ERR, "Invalid arguments. Usage : %s <writefile> <writestr>", argv[0]);   
        fprintf(stderr, "Error: Two arguments required - <writefile> and <writestr>\n");
        closelog();
        return 1;
    }

    const char *writefile=argv[1];
    const char *writestr=argv[2];

    syslog(LOG_DEBUG, "Writing '%s' to '%s'", writestr, writefile);

    // Open the file for writing
    int fd = open(writefile, O_WRONLY | O_CREAT | O_TRUNC, 0644);

    if (fd == -1) {
        syslog(LOG_ERR, "Error opening file '%s': %s", writefile, strerror(errno));
        perror("open");
        closelog();
        return 1;
    }
    ssize_t bytes_written = write(fd, writestr, strlen(writestr));
    if (bytes_written == -1) {
        syslog(LOG_ERR, "Error writing to file '%s': %s", writefile, strerror(errno));
        perror("write");
        close(fd);
        closelog();
        return 1;
    }

    close(fd);
    closelog();
    return 0;
}   