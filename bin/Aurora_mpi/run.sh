#!/bin/sh

source /opt/nec/ve/mpi/1.1.0/bin/necmpivars.sh

# Run on a single VE and eight MPI procs
# ave 600GFlops peak 2.5TFlops
## cmd="mpirun -ve 1 -np 8 ./xhpl"


# Run on a single VE0 and single MPI procs
# using mpisep to separate proginf traces
cmd="mpirun -ve 1 -np 8 ./mpisep.sh ./xhpl"

# Run on four VE in a chassis
# cmd="mpirun -ve 0-3 -np 16 ./xhpl"

# to get Proginf output
export VE_PROGINF=YES

date
echo $cmd
$cmd
date
echo done.
