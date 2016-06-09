import syslog
from subprocess import check_output
from sys import stdin

syslog.openlog("ExaBGP")

while True:
    try:
        line = stdin.readline().strip()

        # When the parent dies we are seeing continual newlines, so we only access so many before stopping
        if line == "":
            counter += 1
            if counter > 100:
                break
            continue

        counter = 0

        # Do actions here
        syslog.syslog(line)

        r = check_output(['supervisorctl', 'status', 'exabgp'])
        #r = check_output(['echo', '$CWD'])
        syslog.syslog(r)

    except KeyboardInterrupt:
        syslog.syslog('done')
    except IOError:
        # most likely a signal during readline
        pass

syslog.syslog('done')
