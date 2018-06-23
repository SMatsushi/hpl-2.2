#!/bin/sh

source /opt/nec/ve/mpi/1.1.0/bin/necmpivars.sh

# Run on a single VE and eight MPI procs
cmd="mpirun -ve 1 -np 8 ./xhpl"
# Run on a single VE0 and single MPI procs
# cmd="mpirun ./xhpl"  # cannot run

# Run on four VE in a chassis
# cmd="mpirun -ve 0-3 -np 16 ./xhpl"

echo $cmd
$cmd
