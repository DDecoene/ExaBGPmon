
[exabgp.api]
encoder = json
highres = false
respawn = false
#socket = '/tmp/exabgp.sock'
socket =  ''

[exabgp.bgp]
openwait = 60

[exabgp.cache]
attributes = true
nexthops = true

[exabgp.daemon]
daemonize = true
pid = '/var/run/exabgp.pid'
user = 'root'

[exabgp.log]
all = false
configuration = true
daemon = true
destination = 'stdout'
enable = true
level = INFO
message = false
network = true
packets = false
parser = false
processes = true
reactor = true
rib = false
routes = false
short = false
timers = false

[exabgp.pdb]
enable = false

[exabgp.profile]
enable = false
file = ''

[exabgp.reactor]
speed = 1.0

[exabgp.tcp]
acl = false
bind = '0.0.0.0'
delay = 0
once = false
port = 179