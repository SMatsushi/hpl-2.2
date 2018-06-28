#!/bin/sh

source /opt/nec/ve/mpi/1.1.0/bin/necmpivars.sh
# make V=1 arch=Aurora_mpi
make arch=Aurora_mpi clean
make arch=Aurora_mpi
