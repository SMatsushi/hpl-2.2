#!/bin/sh

source /opt/nec/ve/mpi/1.1.0/bin/necmpivars.sh

# Run on a single VE
mpirun -ve 0 -np 8 ./xhpl

# Run on four VE in a chassis
# mpirun -ve 0-3 -np 16 ./xhpl
