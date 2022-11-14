#!/bin/bash

set -o xtrace

cd /home/vagrant
rm -rf .oci
rm -f oci.tar.bz2
rm -f oci.tar.bz2.enc
rm -f oci

cp /vagrant/oci /home/vagrant/oci
base64 -d oci > oci.tar.bz2.enc
openssl enc -aes-256-cbc -d -pbkdf2 -in oci.tar.bz2.enc -out oci.tar.bz2
tar xvfj oci.tar.bz2
rm -f oci.tar.bz2
rm -f oci.tar.bz2.enc
rm -f oci
