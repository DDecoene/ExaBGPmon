import syslog
from sys import stdin

syslog.openlog("ExaBGP")
syslog.syslog('test')

while True:
    syslog.syslog('loop')
    time.sleep(5)

syslog.syslog('done')

