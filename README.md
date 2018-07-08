# hpl-2.2
Portable High Performance Linpack (HPL) 2.2  from <http://www.netlib.org/benchmark/hpl/> .

# Description
Modified for NEC SX Aurora Tsubasa. Created Make.Aurora_mpi from './makes/Make.Linux_Intel64_ncc'

Note) The benchmark result is not final or formal as:  

* Code is just out-of-box. The source is un-modified. No special complieoption option is added.
* In Linpack, computation is done in blas (Basic Linear Algebra Subroutines) library:
 <https://en.wikipedia.org/wiki/LINPACK>   
We may say we are just evaluating the library not vector complier.  
We are using:
```
/opt/nec/ve/nlc/1.0.0/lib/libblas_sequential.a
```
The Library path is set by:
```
/opt/nec/ve/mpi/1.1.0/bin/necmpivars.sh
```

* SX Aurora Tsubasa is designed to extract good performance in sparce matrix calicuration or random data access to large data set supported by its hardware (fewer numbers of core, large vector registers, and sophisticated memory pipelie, etc) and vector compilers.

 Along with program optimization or applying heuristics, applications lose parallelizm. Their data access pattern becomes random. It is getting harder to achieving high hit rate on instruction/data cache. 

------
# Usage
Compile and execution is done on NEC Aurora SX server with NEC MPI installed.  
* 'mpincc' : Compiler
* 'mpirun' : Run the compiled executable.

NEC MPI running envirionment setup is written in following shell script. Please run it first.  
```
$ source /opt/nec/ve/mpi/\[version\]/bin/necmpivars.sh
```

The line is included in shell scripts for compile/run refered below.

## How to compile
```
$ sh ./compile.sh
```

## How to run
```
$ cd bin/Aurora_mpi
$ sh ./run.sh
```

 Linpack Tera Flops is shown in stdout after 5 minutes of execution.
 
## Profiling
### PROGINF
* Add -proginf flag to 'mpincc'.  
* export VE_PROGINF before 'mpirun'.  

```
$ export VE_PROGINF=YES
```

Proginf shows statistic information of total program including prolog (setup) and epilog (finalize) codes.  
Its result might be slower due to overheads from other codes than core loop.

## FTRACE
Show execution time distribution of subroutines.  

NOTE) Source code compiled with FTRACE Flags may run very slow.  
  
* Add -ftrace flag to 'mpincc'.
* Run the executable with mpirun as usual, then ftrace.out.\* are created in the current directly.  
* Convert the ftrace.out.\* with 'ftrace' command. Result is printed to stdout:

```
$ /opt/nec/ve/bin/ftrace –f ftrace.out.\*
```

## Other Commands

* 'nreadelf' : to check executable if compiled for NEC SX Aurora Tsubasa.  

```
$ /opt/nec/ve/bin/nreadelf -h a.out
```


If you see 'NEC VE architecture ' in the machine line, 'a.out' is compiled for NEC SX Aurura Tsubasa.

* '/opt/nec/ve/bin/ps' : displays processes on VE (Vector Engine)s.  

```
$ export -n VE_NODE_NUMBER; /opt/nec/ve/bin/ps -ef
```

Please  check help for other options.

```
/opt/nec/ve/bin/ps --help
```
