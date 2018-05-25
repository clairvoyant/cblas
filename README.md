# cblas
Pascal unit interface to cblas, atlas, openblas



Rationale
---------

Need to use fast algebra, mostly with double precision. 

runtime selection of the library

interaction with
   



Why Pascal
----------
Productivy 


Delphi
-------


BLAS Libraries tested and supported
---------
32 vs 64

Design
------


   $ h2pas -d -o cblas.pas /usr/include/cblas.h
   vi


Install
-------

$ export FPCDIR=/usr/lib64/fpc/3.0.4/
$ ./fpmake build --globalunitdir=/usr/lib64/fpc/3.0.4/


Verify
--------

./tests/tests --format=plain --all





32 vs 64 bits
----------------

Usage 
-----------

Library
netlib cblas
openblas
ATLAS
NVBLAS
MKL


Tested
-------

OpenSUSE Leap 42.3
Ubuntu Mate
MacOSX
Windows 10


Benchmarks
----------

Methodology


