#!/bin/bash

# Install essential packages from Apt
apt-get update -y
# Python dev packages
apt-get install -y build-essential python python-dev python-setuptools python-pip mongodb language-pack-nl
# Dependencies for image processing with Pillow (drop-in replacement for PIL)
# supporting: jpeg, tiff, png, freetype, littlecms
apt-get install -y libncurses5-dev libjpeg-dev libtiff-dev zlib1g-dev libfreetype6-dev liblcms2-dev
# Git (we'd rather avoid people keeping credentials for git commits in the repo, but sometimes we need it for pip requirements that aren't in PyPI)
apt-get install -y git

# virtualenv global setup
if ! command -v pip; then
    easy_install -U pip
fi

locale-gen nl_NL.UTF-8

echo "Installing python requirements"
pip install -r /vagrant/requirements.txt

cd /vagrant
echo "Init config"
python manage.py init_config
python manage.py build_config
if [[ ! -f /vagrant/etc/exabgp.env ]]; then
    python manage.py build_env
fi

# Cleanup
apt-get clean

echo "Zeroing free space to improve compression."
dd if=/dev/zero of=/EMPTY bs=1M
rm -f /EMPTY