# hpl-2.2
Portable High Performance Linpack (HPL) 2.2  from <http://www.netlib.org/benchmark/hpl/> .

# Description
Modified for NEC SX Aurora Tsubasa. Created Make.Aurora_mpi from './makes/Make.Linux_Intel64_ncc'

------
# Usage
Compile and execution is done on NEC Aurora SX server with NEC MPI installed.  
* 'mpincc' : Compiler
* 'mpirun' : Run the compiled executable.


NEC MPI running envirionment setup is written in following shell script. Please run it first.  
> $ source /opt/nec/ve/mpi/\[version\]/bin/necmpivars.sh  

The line is included in shell scripts for compile/run refered below.

## How to compile
> $ sh ./compile.sh  

## How to run
> $ cd bin/Aurora_mpi  
> $ sh ./run.sh  

 Linpack Tera Flops is shown in stdout after 5 minutes of execution.
 
## Profiling
### PROGINF
* Add -proginf flag to 'mpincc'.  
* export VE_PROGINF before 'mpirun'.  
> $ export VE_PROGINF=YES  
Proginf shows statistic information of total program including prolog (setup) and epilog (finalize) codes.  
Its result might be slower due to overheads from other codes than core loop.

## FTRACE
Show execution time distribution of subroutines.  

NOTE) Source code compiled with FTRACE Flags may run very slow.  
  
* Add -ftrace flag to 'mpincc'.
* Run the executable with mpirun as usual, then ftrace.out.\* are created in the current directly.  
* Convert the ftrace.out.\* with 'ftrace' command. Result is printed to stdout:
> $ /opt/nec/ve/bin/ftrace –f ftrace.out.\*  


## Other Commands

* 'nreadelf' : check executable is whether compiled for NEC SX Aurora Tsubasa.  
> $ /opt/nec/ve/bin/nreadelf -h a.out  


If you see 'NEC VE architecture ' in the machine line, 'a.out' is compiled for NEC SX Aurura Tsubasa.

* '/opt/nec/ve/bin/ps' : display processes on VE (Vector Engine)s.  

> $ export -n VE_NODE_NUMBER; /opt/nec/ve/bin/ps -ef  

Please  check /opt/nec/ve/bin/ps --help for options.
