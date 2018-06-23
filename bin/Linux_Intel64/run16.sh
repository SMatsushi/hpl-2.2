#PBS –T necmpi
#PBS -b 4 # Number of hosts
#PBS --venum-lhost=4 # Number of VEs
#PBS --use-hca=1 # Number of HCAs
source /opt/nec/ve/mpi/1.1.0/bin/necmpivars.sh 

mpirun -nnp 4 -nn 4 -ve 0-4 ./xhpl 
