#!/usr/bin/env bash

echo "Start Supervisor"
supervisord -c /vagrant/etc/supervisord.conf
supervisorctl start exabgp
supervisorctl start flaskapp