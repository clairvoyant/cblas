# cblas
Pascal unit interface to cblas, atlas, openblas, nvblas....


Rationale
---------
The algebraic vector and matrix operations are easy to implement, but 
the straightforward implementation is not the most performant one. 

There are optimized algebra libraries that can boost the operations by 40x.
Those libraries take advantage of handcrafted assembly code, CPU L1/L2 cache and 
parallelism in GPUs.


This UNIT provide binding to libraries that use the CBLAS interface.

Requirements
------------
The main requirements during the implementation of the CBLAS Unit where:

   * Reuse of the  CBLAS interface.
   * Dynamic linking.
   * Runtime selection of the library, the unit shall be able to select the library during execution.
   * Hide the Windows/Linux/OSX details. 
   * FreePascal / Delphi


The CBLAS procedure that I mostly use is the `dgemm`, and I wish to compare between the different implementations for
the kind of matrix that I use. (medium size 4000 x 10000). 

Why Pascal
----------

From my humble experience, the main point of friction when writing an application are the graphical user interfaces.
The Pascal libraries excel in writing user interfaces. 

If asked to define in a single word why I use Pascal for some project, that word is `Productivity´. 
The IDE (Lazarus or Delphi), are boost the productivity in such a way that the typical CRUD application 
can be done in a glimpse. 

Nevertheless, one of the strengths of the Pascal environment is the integration with other languages/libraries. 

This unit was written in 40 minutes, using `h2pas` and `vim macros`. The friction of interacting with foreign languages 
is almost negligible. 


FreePascal/Lazarus
------------------
The cblas unit has been developed and tested with free pascal. 

Delphi
-------
This unit has not been tested with Delphi, (I haven't used Delphi in the last 12 years). 

I'm open to adapt to Delphi, if a kind soul provides me a license 😊, Nevertheless, is you do the adaptation work, I will merge your changes.


Testing
-------
The cblas unit has been tested in following OSs. 


|  Library                                                      | FreeBSD  | Ubuntu   | SUSE   | Windows 10 | OSX |
|---------------------------------------------------------------|----------|----------|--------|------------|-----|
| [Netlib BLAS](http://www.netlib.org/blas/)                    |    X     |   x      |  x     |            |  x  |
| [OpenBLAS](https://www.openblas.net/)                         |    X     |   x      |  x     |            |     |
| [ATLAS](http://math-atlas.sourceforge.net/)                   |    X     |   x      |  x     |            |     |
| [Netlib BLAS](https://docs.nvidia.com/cuda/nvblas/index.html) |          |          |        |            |     |
| [Intel MKL](https://software.intel.com/en-us/mkl)             |    X     |          |        |            |     |


The cblas unit has been tested in following CPUs. 

|  Library                                                      | AMD/Intel 64 | AMD/Intel 32 | ARM 64 | ARM 32 |
|---------------------------------------------------------------|--------------|--------------|--------|--------|
| [Netlib BLAS](http://www.netlib.org/blas/)                    |    X         |              |  x     |        |
| [OpenBLAS](https://www.openblas.net/)                         |    X         |              |        |        |
| [ATLAS](http://math-atlas.sourceforge.net/)                   |    X         |              |        |        |
| [Netlib BLAS](https://docs.nvidia.com/cuda/nvblas/index.html) |    X         |              |        |        |
| [Intel MKL](https://software.intel.com/en-us/mkl)             |    X         |              |        |        |




Design
------
The header used to create the cblas.pas was the netlib cblas.h. 

The unit follows the same approach as the SQLite unit. All functions are assigned to an address 
using the LoadLibrary + GetProcedureAddress. All of them are explicitly loaded. With this approach is 
possible to load the shared library dynamically.

The usage of the external library name is avoided because it assigns the library magically. 


Usage
-----

The naming of the CBLAS functions has been preserved. 
The same names used in the CBLAS headers will be used. 

You shall take care of the library to use in the InitializeCBLAS. 
But if you want to use other library or a non-default name, you can use
the InitializeCBLAS pointing out to the library. 

Take care of the PATH variable that will be used to locate the libraries. 
The same rules as LoadLibrary will apply. 


Simple code using 
```Pascal
     InitializeCBLAS;

    ...

    cblas_dgemm(CblasRowMajor, CblasNoTrans, CblasNoTrans,
              m,n,k, { m, n, k }
              1,     { alpha   }
                A, k,
                B, n,
              1,
                C,n
             );


     ....

     ReleaseCBLAS;
```


In case your library is not libopenblas, the  InitializeCBLAS procedure shall be called with the libraries and dependencies to load.  Take care of the suffix 
(.so, .dll, .dylib) in Linux, windows and OSX. 

| Library | Initialization                                       |
|---------|-----------------------------------------------------|
|netlib cblas | InitializeCBLAS(['libblas.so'], 'libcblas.so'); |
|openblas     | InitializeCBLAS([], 'libopenblas.so');          | 
|ATLAS        | InitializeCBLAS([], 'libopenblas.so');          |
|NVBLAS       | TBD                                             |
|MKL          | TBD                                             |

The netlib cblas has dependencies in the Fortran libblas. The dependency array shall include all libraries the CBLAS depend on. 
Otherwise there will be unresolved symbols.


Matrix Memory Layout
-------------------

All BLAS functions assume that the matrix and vector data are stored contiguously in memory. 
This implies for example that a matrix cannot be represented as a vector of vectors. It needs to be represented as a block of N x M contiguous elements in memory. 
Moreover, vectors and matrices of complex numbers must be stored such that the real and imaginary parts of a given element are contiguous in memory.

For matrices in mathematical notation, the first index usually indicates the row, and the second indicates the column, e.g., given a matrix A , a1,2 is in its first row and second column. 

![equation](https://latex.codecogs.com/gif.latex?%5Cbegin%7Bbmatrix%7D%20a_1_1%20%26%20a_1_3%20%26%20a_1_3%5C%5C%20a_2_1%20%26%20a_2_3%20%26%20a_2_3%5C%5C%20a_3_1%20%26%20a_3_2%20%26%20a_3_3%20%5Cend%7Bbmatrix%7D)


There are two ways of placing previous matrix in memory, either put the rows one after other or place the columns. 
Those two variants: row-major, and column-major. For CBLAS both are supported equally well,

Row-major order (C, Pascal).

|Address | Access  | Value |
|--------|---------|-------|
|0       | A[0][0] | a_1_1 |
|1       | A[0][1] | a_1_2 |
|2       | A[0][2] | a_1_3 |
|3       | A[1][0] | a_2_1 |
|4       | A[1][1] | a_2_2 |
|5       | A[1][2] | a_2_3 |

Column-major order (Fortran).

|Address | Access  |Value |
|--------|---------|------|
|1       | A(0,0)  |a_1_1 |
|2       | A(1,0)  |a_2_1 |
|3       | A(0,1)  |a_1_2 |
|4       | A(1,1)  |a_2_2 |
|5       | A(0,2)  |a_1_3 |
|6       | A(2,2)  |a_2_3 |

Pascal (like C) uses  Row Mayor Order. Fortunatelly the CBLAS library allows the selection of the matrix order. 


Install
-------

```sh
$ git clone https://github.com/clairvoyant/cblas
$ cd cblas
$ fpc fpmake
$ fpmake build
$ fpmake install
``` 

If your FreePascal instalation is not in the standard place, you need to point to the global unit dir. 

```sh
$ ./fpmake build --globalunitdir=/usr/lib64/fpc/3.0.4/
```


Verify
--------

There are some unit tests to verify the environment.

```sh
$ ./tests/tests --format=plain --all
```


32 vs 64 bits
----------------
Verifycation has been performed in 64bits architectures. 
There can be issues in 32 bit environment.


Benchmarks
----------

TODO


TODO
----
   * test: in 32-bit environments. 
   * test: with Delphi
   * test: nvblas in Linux
   * Publish the benchmarks.

References
-----------
  * Choosing the optimal BLAS and LAPACK library, Tobias Wittwer, 2008
  * [Foad Sojoodi Farimani, Curated list of cblas resources](https://github.com/Foadsf/Cmathtuts)
  * [Column vs Row major order](https://en.wikipedia.org/wiki/Row-_and_column-major_order)


CBLAS Libraries
---------------
  * [Netlib BLAS](http://www.netlib.org/blas/)
  * [OpenBLAS](https://www.openblas.net/)
  * [ATLAS](http://math-atlas.sourceforge.net/)
  * [Netlib BLAS](https://docs.nvidia.com/cuda/nvblas/index.html)
  * [Intel MKL](https://software.intel.com/en-us/mkl)

