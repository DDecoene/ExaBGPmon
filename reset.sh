#!/usr/bin/env bash

vagrant destroy -f

rm *.log

cd etc

rm conf.ini
rm exabgp.env

vagrant up

