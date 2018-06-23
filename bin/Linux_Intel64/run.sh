#!/bin/sh

source /opt/nec/ve/mpi/1.1.0/bin/necmpivars.sh

mpirun -ve 0-3 -np 16 ./xhpl
