#!/bin/bash

set -o xtrace

cd /home/vagrant
rm -f oci.tar.bz2
rm -f oci.tar.bz2.enc
rm -f oci

tar cvfj oci.tar.bz2 .oci
openssl enc -aes-256-cbc -pbkdf2 -in oci.tar.bz2 -out oci.tar.bz2.enc
base64 oci.tar.bz2.enc > oci
cp oci /vagrant/oci
rm -f oci.tar.bz2
rm -f oci.tar.bz2.enc
rm -f oci
