# 1. Introduction

BeliefFuzz is a bounded seed scheduling fuzzer based on [AFL](https://github.com/google/AFL). This directory provides the prototype of compiler and fuzzer for artifacts evaluation. More details can be found in the github [repo](https://github.com/belieffuzz/belieffuzz_artifacts).


# 2. Compile
Binary recompilation is required as BeliefFuzz implements a precondition analysis and an instrumentation component based on LLVM for scheduling.
During the compilation, BeliefFuzz will collect the edge information into a specified file with the FLAG "-res=$EDGE_POTENTIAL_PATH".

A nearly-universal approach to compile the target C program would be:

```shell
$ export BELIEFFUZZ_CFLAGS="-res=$EDGE_POTENTIAL_PATH"
$ CFLAGS="$BELIEFFUZZ_CFLAGS" CC=$BELIEFFUZZ_PATH/afl-clang-fast ./configure
```

# 3. Run
./afl-fuzz -r -p -c $EDGE_POTENTIAL_PATH/edge_potential.txt -i fuzz_in -o fuzz_out -- $PROG_PATH [...]

Here is the extra command line option for our scheduling method:
```
-r            - use MCTS model for seed selection
-p            - use Regret-based power scheduling
-c file       - load the edge weight file
```
