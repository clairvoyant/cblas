{$mode objfpc}{$h+}

unit cblas;

interface

uses                                                                            
  ctypes,                                                                       
  SysUtils, DynLibs;                                                            
                                                                                
const                                                                           
{$IFDEF WINDOWS}                                                                
  CBLASLib = 'libopenblas.dll';                                                   
{$else}                                                                         
  CBLASLib = 'libopenblas.'+sharedsuffix;                                      
{$endif}                                                                        
                    

{
  Automatically converted by H2Pas 1.0.0 from /usr/include/cblas.h
  The following command line parameters were used:
    -d
    -o
    cblas.pas
    /usr/include/cblas.h
}

type
  Pchar  = ^char;
  Pdouble  = ^double;
  Psingle  = ^single;
  CBLAS_INDEX = longint;

{$IFDEF FPC}
{$PACKRECORDS C}
{$ENDIF}


  CBLAS_ORDER = (CblasRowMajor := 101,CblasColMajor := 102);
  CBLAS_TRANSPOSE = (CblasNoTrans := 111,CblasTrans := 112,CblasConjTrans := 113);
  CBLAS_UPLO = (CblasUpper := 121,CblasLower := 122);
  CBLAS_DIAG = (CblasNonUnit := 131,CblasUnit := 132);
  CBLAS_SIDE = (CblasLeft := 141,CblasRight := 142);

  {
   * ===========================================================================
   * Prototypes for level 1 BLAS functions (complex are recast as routines)
   * ===========================================================================
  }
  Tcblas_sdsdot = function(N:longint; alpha:single; X:Psingle; incX:longint; Y:Psingle; 
             incY:longint):single;cdecl;
  Tcblas_dsdot = function(N:longint; X:Psingle; incX:longint; Y:Psingle; incY:longint):double;cdecl;
  Tcblas_sdot = function(N:longint; X:Psingle; incX:longint; Y:Psingle; incY:longint):single;cdecl;
  Tcblas_ddot = function(N:longint; X:Pdouble; incX:longint; Y:Pdouble; incY:longint):double;cdecl;
  {
   * Functions having prefixes Z and C only
  }
  Tcblas_cdotu_sub = procedure(N:longint; X:pointer; incX:longint; Y:pointer; incY:longint; 
              dotu:pointer);cdecl;
  Tcblas_cdotc_sub = procedure(N:longint; X:pointer; incX:longint; Y:pointer; incY:longint; 
              dotc:pointer);cdecl;
  Tcblas_zdotu_sub = procedure(N:longint; X:pointer; incX:longint; Y:pointer; incY:longint; 
              dotu:pointer);cdecl;
  Tcblas_zdotc_sub = procedure(N:longint; X:pointer; incX:longint; Y:pointer; incY:longint; 
              dotc:pointer);cdecl;
  {
   * Functions having prefixes S D SC DZ
  }
  Tcblas_snrm2 = function(N:longint; X:Psingle; incX:longint):single;cdecl;
  Tcblas_sasum = function(N:longint; X:Psingle; incX:longint):single;cdecl;
  Tcblas_dnrm2 = function(N:longint; X:Pdouble; incX:longint):double;cdecl;
  Tcblas_dasum = function(N:longint; X:Pdouble; incX:longint):double;cdecl;
  Tcblas_scnrm2 = function(N:longint; X:pointer; incX:longint):single;cdecl;
  Tcblas_scasum = function(N:longint; X:pointer; incX:longint):single;cdecl;
  Tcblas_dznrm2 = function(N:longint; X:pointer; incX:longint):double;cdecl;
  Tcblas_dzasum = function(N:longint; X:pointer; incX:longint):double;cdecl;
  {
   * Functions having standard 4 prefixes (S D C Z)
  }
  Tcblas_isamax = function(N:longint; X:Psingle; incX:longint):CBLAS_INDEX;cdecl;
  Tcblas_idamax = function(N:longint; X:Pdouble; incX:longint):CBLAS_INDEX;cdecl;
  Tcblas_icamax = function(N:longint; X:pointer; incX:longint):CBLAS_INDEX;cdecl;
  Tcblas_izamax = function(N:longint; X:pointer; incX:longint):CBLAS_INDEX;cdecl;
  {
   * ===========================================================================
   * Prototypes for level 1 BLAS routines
   * ===========================================================================
  }
  { 
   * Routines with standard 4 prefixes (s, d, c, z)
  }
  Tcblas_sswap = procedure(N:longint; X:Psingle; incX:longint; Y:Psingle; incY:longint);cdecl;
  Tcblas_scopy = procedure(N:longint; X:Psingle; incX:longint; Y:Psingle; incY:longint);cdecl;
  Tcblas_saxpy = procedure(N:longint; alpha:single; X:Psingle; incX:longint; Y:Psingle; 
              incY:longint);cdecl;
  Tcblas_dswap = procedure(N:longint; X:Pdouble; incX:longint; Y:Pdouble; incY:longint);cdecl;
  Tcblas_dcopy = procedure(N:longint; X:Pdouble; incX:longint; Y:Pdouble; incY:longint);cdecl;
  Tcblas_daxpy = procedure(N:longint; alpha:double; X:Pdouble; incX:longint; Y:Pdouble; 
              incY:longint);cdecl;
  Tcblas_cswap = procedure(N:longint; X:pointer; incX:longint; Y:pointer; incY:longint);cdecl;
  Tcblas_ccopy = procedure(N:longint; X:pointer; incX:longint; Y:pointer; incY:longint);cdecl;
  Tcblas_caxpy = procedure(N:longint; alpha:pointer; X:pointer; incX:longint; Y:pointer; 
              incY:longint);cdecl;
  Tcblas_zswap = procedure(N:longint; X:pointer; incX:longint; Y:pointer; incY:longint);cdecl;
  Tcblas_zcopy = procedure(N:longint; X:pointer; incX:longint; Y:pointer; incY:longint);cdecl;
  Tcblas_zaxpy = procedure(N:longint; alpha:pointer; X:pointer; incX:longint; Y:pointer; 
              incY:longint);cdecl;
  { 
   * Routines with S and D prefix only
  }
  Tcblas_srotg = procedure(a:Psingle; b:Psingle; c:Psingle; s:Psingle);cdecl;
  Tcblas_srotmg = procedure(d1:Psingle; d2:Psingle; b1:Psingle; b2:single; P:Psingle);cdecl;
  Tcblas_srot = procedure(N:longint; X:Psingle; incX:longint; Y:Psingle; incY:longint; 
              c:single; s:single);cdecl;
  Tcblas_srotm = procedure(N:longint; X:Psingle; incX:longint; Y:Psingle; incY:longint; 
              P:Psingle);cdecl;
  Tcblas_drotg = procedure(a:Pdouble; b:Pdouble; c:Pdouble; s:Pdouble);cdecl;
  Tcblas_drotmg = procedure(d1:Pdouble; d2:Pdouble; b1:Pdouble; b2:double; P:Pdouble);cdecl;
  Tcblas_drot = procedure(N:longint; X:Pdouble; incX:longint; Y:Pdouble; incY:longint; 
              c:double; s:double);cdecl;
  Tcblas_drotm = procedure(N:longint; X:Pdouble; incX:longint; Y:Pdouble; incY:longint; 
              P:Pdouble);cdecl;
  { 
   * Routines with S D C Z CS and ZD prefixes
  }
  Tcblas_sscal = procedure(N:longint; alpha:single; X:Psingle; incX:longint);cdecl;
  Tcblas_dscal = procedure(N:longint; alpha:double; X:Pdouble; incX:longint);cdecl;
  Tcblas_cscal = procedure(N:longint; alpha:pointer; X:pointer; incX:longint);cdecl;
  Tcblas_zscal = procedure(N:longint; alpha:pointer; X:pointer; incX:longint);cdecl;
  Tcblas_csscal = procedure(N:longint; alpha:single; X:pointer; incX:longint);cdecl;
  Tcblas_zdscal = procedure(N:longint; alpha:double; X:pointer; incX:longint);cdecl;
  {
   * ===========================================================================
   * Prototypes for level 2 BLAS
   * ===========================================================================
  }
  { 
   * Routines with standard 4 prefixes (S, D, C, Z)
  }
  Tcblas_sgemv = procedure(order:CBLAS_ORDER; TransA:CBLAS_TRANSPOSE; M:longint; N:longint; alpha:single; 
              A:Psingle; lda:longint; X:Psingle; incX:longint; beta:single; 
              Y:Psingle; incY:longint);cdecl;
  Tcblas_sgbmv = procedure(order:CBLAS_ORDER; TransA:CBLAS_TRANSPOSE; M:longint; N:longint; KL:longint; 
              KU:longint; alpha:single; A:Psingle; lda:longint; X:Psingle; 
              incX:longint; beta:single; Y:Psingle; incY:longint);cdecl;
  Tcblas_strmv = procedure(order:CBLAS_ORDER; Uplo:CBLAS_UPLO; TransA:CBLAS_TRANSPOSE; Diag:CBLAS_DIAG; N:longint; 
              A:Psingle; lda:longint; X:Psingle; incX:longint);cdecl;
  Tcblas_stbmv = procedure(order:CBLAS_ORDER; Uplo:CBLAS_UPLO; TransA:CBLAS_TRANSPOSE; Diag:CBLAS_DIAG; N:longint; 
              K:longint; A:Psingle; lda:longint; X:Psingle; incX:longint);cdecl;
  Tcblas_stpmv = procedure(order:CBLAS_ORDER; Uplo:CBLAS_UPLO; TransA:CBLAS_TRANSPOSE; Diag:CBLAS_DIAG; N:longint; 
              Ap:Psingle; X:Psingle; incX:longint);cdecl;
  Tcblas_strsv = procedure(order:CBLAS_ORDER; Uplo:CBLAS_UPLO; TransA:CBLAS_TRANSPOSE; Diag:CBLAS_DIAG; N:longint; 
              A:Psingle; lda:longint; X:Psingle; incX:longint);cdecl;
  Tcblas_stbsv = procedure(order:CBLAS_ORDER; Uplo:CBLAS_UPLO; TransA:CBLAS_TRANSPOSE; Diag:CBLAS_DIAG; N:longint; 
              K:longint; A:Psingle; lda:longint; X:Psingle; incX:longint);cdecl;
  Tcblas_stpsv = procedure(order:CBLAS_ORDER; Uplo:CBLAS_UPLO; TransA:CBLAS_TRANSPOSE; Diag:CBLAS_DIAG; N:longint; 
              Ap:Psingle; X:Psingle; incX:longint);cdecl;
  Tcblas_dgemv = procedure(order:CBLAS_ORDER; TransA:CBLAS_TRANSPOSE; M:longint; N:longint; alpha:double; 
              A:Pdouble; lda:longint; X:Pdouble; incX:longint; beta:double; 
              Y:Pdouble; incY:longint);cdecl;
  Tcblas_dgbmv = procedure(order:CBLAS_ORDER; TransA:CBLAS_TRANSPOSE; M:longint; N:longint; KL:longint; 
              KU:longint; alpha:double; A:Pdouble; lda:longint; X:Pdouble; 
              incX:longint; beta:double; Y:Pdouble; incY:longint);cdecl;
  Tcblas_dtrmv = procedure(order:CBLAS_ORDER; Uplo:CBLAS_UPLO; TransA:CBLAS_TRANSPOSE; Diag:CBLAS_DIAG; N:longint; 
              A:Pdouble; lda:longint; X:Pdouble; incX:longint);cdecl;
  Tcblas_dtbmv = procedure(order:CBLAS_ORDER; Uplo:CBLAS_UPLO; TransA:CBLAS_TRANSPOSE; Diag:CBLAS_DIAG; N:longint; 
              K:longint; A:Pdouble; lda:longint; X:Pdouble; incX:longint);cdecl;
  Tcblas_dtpmv = procedure(order:CBLAS_ORDER; Uplo:CBLAS_UPLO; TransA:CBLAS_TRANSPOSE; Diag:CBLAS_DIAG; N:longint; 
              Ap:Pdouble; X:Pdouble; incX:longint);cdecl;
  Tcblas_dtrsv = procedure(order:CBLAS_ORDER; Uplo:CBLAS_UPLO; TransA:CBLAS_TRANSPOSE; Diag:CBLAS_DIAG; N:longint; 
              A:Pdouble; lda:longint; X:Pdouble; incX:longint);cdecl;
  Tcblas_dtbsv = procedure(order:CBLAS_ORDER; Uplo:CBLAS_UPLO; TransA:CBLAS_TRANSPOSE; Diag:CBLAS_DIAG; N:longint; 
              K:longint; A:Pdouble; lda:longint; X:Pdouble; incX:longint);cdecl;
  Tcblas_dtpsv = procedure(order:CBLAS_ORDER; Uplo:CBLAS_UPLO; TransA:CBLAS_TRANSPOSE; Diag:CBLAS_DIAG; N:longint; 
              Ap:Pdouble; X:Pdouble; incX:longint);cdecl;
  Tcblas_cgemv = procedure(order:CBLAS_ORDER; TransA:CBLAS_TRANSPOSE; M:longint; N:longint; alpha:pointer; 
              A:pointer; lda:longint; X:pointer; incX:longint; beta:pointer; 
              Y:pointer; incY:longint);cdecl;
  Tcblas_cgbmv = procedure(order:CBLAS_ORDER; TransA:CBLAS_TRANSPOSE; M:longint; N:longint; KL:longint; 
              KU:longint; alpha:pointer; A:pointer; lda:longint; X:pointer; 
              incX:longint; beta:pointer; Y:pointer; incY:longint);cdecl;
  Tcblas_ctrmv = procedure(order:CBLAS_ORDER; Uplo:CBLAS_UPLO; TransA:CBLAS_TRANSPOSE; Diag:CBLAS_DIAG; N:longint; 
              A:pointer; lda:longint; X:pointer; incX:longint);cdecl;
  Tcblas_ctbmv = procedure(order:CBLAS_ORDER; Uplo:CBLAS_UPLO; TransA:CBLAS_TRANSPOSE; Diag:CBLAS_DIAG; N:longint; 
              K:longint; A:pointer; lda:longint; X:pointer; incX:longint);cdecl;
  Tcblas_ctpmv = procedure(order:CBLAS_ORDER; Uplo:CBLAS_UPLO; TransA:CBLAS_TRANSPOSE; Diag:CBLAS_DIAG; N:longint; 
              Ap:pointer; X:pointer; incX:longint);cdecl;
  Tcblas_ctrsv = procedure(order:CBLAS_ORDER; Uplo:CBLAS_UPLO; TransA:CBLAS_TRANSPOSE; Diag:CBLAS_DIAG; N:longint; 
              A:pointer; lda:longint; X:pointer; incX:longint);cdecl;
  Tcblas_ctbsv = procedure(order:CBLAS_ORDER; Uplo:CBLAS_UPLO; TransA:CBLAS_TRANSPOSE; Diag:CBLAS_DIAG; N:longint; 
              K:longint; A:pointer; lda:longint; X:pointer; incX:longint);cdecl;
  Tcblas_ctpsv = procedure(order:CBLAS_ORDER; Uplo:CBLAS_UPLO; TransA:CBLAS_TRANSPOSE; Diag:CBLAS_DIAG; N:longint; 
              Ap:pointer; X:pointer; incX:longint);cdecl;
  Tcblas_zgemv = procedure(order:CBLAS_ORDER; TransA:CBLAS_TRANSPOSE; M:longint; N:longint; alpha:pointer; 
              A:pointer; lda:longint; X:pointer; incX:longint; beta:pointer; 
              Y:pointer; incY:longint);cdecl;
  Tcblas_zgbmv = procedure(order:CBLAS_ORDER; TransA:CBLAS_TRANSPOSE; M:longint; N:longint; KL:longint; 
              KU:longint; alpha:pointer; A:pointer; lda:longint; X:pointer; 
              incX:longint; beta:pointer; Y:pointer; incY:longint);cdecl;
  Tcblas_ztrmv = procedure(order:CBLAS_ORDER; Uplo:CBLAS_UPLO; TransA:CBLAS_TRANSPOSE; Diag:CBLAS_DIAG; N:longint; 
              A:pointer; lda:longint; X:pointer; incX:longint);cdecl;
  Tcblas_ztbmv = procedure(order:CBLAS_ORDER; Uplo:CBLAS_UPLO; TransA:CBLAS_TRANSPOSE; Diag:CBLAS_DIAG; N:longint; 
              K:longint; A:pointer; lda:longint; X:pointer; incX:longint);cdecl;
  Tcblas_ztpmv = procedure(order:CBLAS_ORDER; Uplo:CBLAS_UPLO; TransA:CBLAS_TRANSPOSE; Diag:CBLAS_DIAG; N:longint; 
              Ap:pointer; X:pointer; incX:longint);cdecl;
  Tcblas_ztrsv = procedure(order:CBLAS_ORDER; Uplo:CBLAS_UPLO; TransA:CBLAS_TRANSPOSE; Diag:CBLAS_DIAG; N:longint; 
              A:pointer; lda:longint; X:pointer; incX:longint);cdecl;
  Tcblas_ztbsv = procedure(order:CBLAS_ORDER; Uplo:CBLAS_UPLO; TransA:CBLAS_TRANSPOSE; Diag:CBLAS_DIAG; N:longint; 
              K:longint; A:pointer; lda:longint; X:pointer; incX:longint);cdecl;
  Tcblas_ztpsv = procedure(order:CBLAS_ORDER; Uplo:CBLAS_UPLO; TransA:CBLAS_TRANSPOSE; Diag:CBLAS_DIAG; N:longint; 
              Ap:pointer; X:pointer; incX:longint);cdecl;
  { 
   * Routines with S and D prefixes only
  }
  Tcblas_ssymv = procedure(order:CBLAS_ORDER; Uplo:CBLAS_UPLO; N:longint; alpha:single; A:Psingle; 
              lda:longint; X:Psingle; incX:longint; beta:single; Y:Psingle; 
              incY:longint);cdecl;
  Tcblas_ssbmv = procedure(order:CBLAS_ORDER; Uplo:CBLAS_UPLO; N:longint; K:longint; alpha:single; 
              A:Psingle; lda:longint; X:Psingle; incX:longint; beta:single; 
              Y:Psingle; incY:longint);cdecl;
  Tcblas_sspmv = procedure(order:CBLAS_ORDER; Uplo:CBLAS_UPLO; N:longint; alpha:single; Ap:Psingle; 
              X:Psingle; incX:longint; beta:single; Y:Psingle; incY:longint);cdecl;
  Tcblas_sger = procedure(order:CBLAS_ORDER; M:longint; N:longint; alpha:single; X:Psingle; 
              incX:longint; Y:Psingle; incY:longint; A:Psingle; lda:longint);cdecl;
  Tcblas_ssyr = procedure(order:CBLAS_ORDER; Uplo:CBLAS_UPLO; N:longint; alpha:single; X:Psingle; 
              incX:longint; A:Psingle; lda:longint);cdecl;
  Tcblas_sspr = procedure(order:CBLAS_ORDER; Uplo:CBLAS_UPLO; N:longint; alpha:single; X:Psingle; 
              incX:longint; Ap:Psingle);cdecl;
  Tcblas_ssyr2 = procedure(order:CBLAS_ORDER; Uplo:CBLAS_UPLO; N:longint; alpha:single; X:Psingle; 
              incX:longint; Y:Psingle; incY:longint; A:Psingle; lda:longint);cdecl;
  Tcblas_sspr2 = procedure(order:CBLAS_ORDER; Uplo:CBLAS_UPLO; N:longint; alpha:single; X:Psingle; 
              incX:longint; Y:Psingle; incY:longint; A:Psingle);cdecl;
  Tcblas_dsymv = procedure(order:CBLAS_ORDER; Uplo:CBLAS_UPLO; N:longint; alpha:double; A:Pdouble; 
              lda:longint; X:Pdouble; incX:longint; beta:double; Y:Pdouble; 
              incY:longint);cdecl;
  Tcblas_dsbmv = procedure(order:CBLAS_ORDER; Uplo:CBLAS_UPLO; N:longint; K:longint; alpha:double; 
              A:Pdouble; lda:longint; X:Pdouble; incX:longint; beta:double; 
              Y:Pdouble; incY:longint);cdecl;
  Tcblas_dspmv = procedure(order:CBLAS_ORDER; Uplo:CBLAS_UPLO; N:longint; alpha:double; Ap:Pdouble; 
              X:Pdouble; incX:longint; beta:double; Y:Pdouble; incY:longint);cdecl;
  Tcblas_dger = procedure(order:CBLAS_ORDER; M:longint; N:longint; alpha:double; X:Pdouble; 
              incX:longint; Y:Pdouble; incY:longint; A:Pdouble; lda:longint);cdecl;
  Tcblas_dsyr = procedure(order:CBLAS_ORDER; Uplo:CBLAS_UPLO; N:longint; alpha:double; X:Pdouble; 
              incX:longint; A:Pdouble; lda:longint);cdecl;
  Tcblas_dspr = procedure(order:CBLAS_ORDER; Uplo:CBLAS_UPLO; N:longint; alpha:double; X:Pdouble; 
              incX:longint; Ap:Pdouble);cdecl;
  Tcblas_dsyr2 = procedure(order:CBLAS_ORDER; Uplo:CBLAS_UPLO; N:longint; alpha:double; X:Pdouble; 
              incX:longint; Y:Pdouble; incY:longint; A:Pdouble; lda:longint);cdecl;
  Tcblas_dspr2 = procedure(order:CBLAS_ORDER; Uplo:CBLAS_UPLO; N:longint; alpha:double; X:Pdouble; 
              incX:longint; Y:Pdouble; incY:longint; A:Pdouble);cdecl;
  { 
   * Routines with C and Z prefixes only
  }
  Tcblas_chemv = procedure(order:CBLAS_ORDER; Uplo:CBLAS_UPLO; N:longint; alpha:pointer; A:pointer; 
              lda:longint; X:pointer; incX:longint; beta:pointer; Y:pointer; 
              incY:longint);cdecl;
  Tcblas_chbmv = procedure(order:CBLAS_ORDER; Uplo:CBLAS_UPLO; N:longint; K:longint; alpha:pointer; 
              A:pointer; lda:longint; X:pointer; incX:longint; beta:pointer; 
              Y:pointer; incY:longint);cdecl;
  Tcblas_chpmv = procedure(order:CBLAS_ORDER; Uplo:CBLAS_UPLO; N:longint; alpha:pointer; Ap:pointer; 
              X:pointer; incX:longint; beta:pointer; Y:pointer; incY:longint);cdecl;
  Tcblas_cgeru = procedure(order:CBLAS_ORDER; M:longint; N:longint; alpha:pointer; X:pointer; 
              incX:longint; Y:pointer; incY:longint; A:pointer; lda:longint);cdecl;
  Tcblas_cgerc = procedure(order:CBLAS_ORDER; M:longint; N:longint; alpha:pointer; X:pointer; 
              incX:longint; Y:pointer; incY:longint; A:pointer; lda:longint);cdecl;
  Tcblas_cher = procedure(order:CBLAS_ORDER; Uplo:CBLAS_UPLO; N:longint; alpha:single; X:pointer; 
              incX:longint; A:pointer; lda:longint);cdecl;
  Tcblas_chpr = procedure(order:CBLAS_ORDER; Uplo:CBLAS_UPLO; N:longint; alpha:single; X:pointer; 
              incX:longint; A:pointer);cdecl;
  Tcblas_cher2 = procedure(order:CBLAS_ORDER; Uplo:CBLAS_UPLO; N:longint; alpha:pointer; X:pointer; 
              incX:longint; Y:pointer; incY:longint; A:pointer; lda:longint);cdecl;
  Tcblas_chpr2 = procedure(order:CBLAS_ORDER; Uplo:CBLAS_UPLO; N:longint; alpha:pointer; X:pointer; 
              incX:longint; Y:pointer; incY:longint; Ap:pointer);cdecl;
  Tcblas_zhemv = procedure(order:CBLAS_ORDER; Uplo:CBLAS_UPLO; N:longint; alpha:pointer; A:pointer; 
              lda:longint; X:pointer; incX:longint; beta:pointer; Y:pointer; 
              incY:longint);cdecl;
  Tcblas_zhbmv = procedure(order:CBLAS_ORDER; Uplo:CBLAS_UPLO; N:longint; K:longint; alpha:pointer; 
              A:pointer; lda:longint; X:pointer; incX:longint; beta:pointer; 
              Y:pointer; incY:longint);cdecl;
  Tcblas_zhpmv = procedure(order:CBLAS_ORDER; Uplo:CBLAS_UPLO; N:longint; alpha:pointer; Ap:pointer; 
              X:pointer; incX:longint; beta:pointer; Y:pointer; incY:longint);cdecl;
  Tcblas_zgeru = procedure(order:CBLAS_ORDER; M:longint; N:longint; alpha:pointer; X:pointer; 
              incX:longint; Y:pointer; incY:longint; A:pointer; lda:longint);cdecl;
  Tcblas_zgerc = procedure(order:CBLAS_ORDER; M:longint; N:longint; alpha:pointer; X:pointer; 
              incX:longint; Y:pointer; incY:longint; A:pointer; lda:longint);cdecl;
  Tcblas_zher = procedure(order:CBLAS_ORDER; Uplo:CBLAS_UPLO; N:longint; alpha:double; X:pointer; 
              incX:longint; A:pointer; lda:longint);cdecl;
  Tcblas_zhpr = procedure(order:CBLAS_ORDER; Uplo:CBLAS_UPLO; N:longint; alpha:double; X:pointer; 
              incX:longint; A:pointer);cdecl;
  Tcblas_zher2 = procedure(order:CBLAS_ORDER; Uplo:CBLAS_UPLO; N:longint; alpha:pointer; X:pointer; 
              incX:longint; Y:pointer; incY:longint; A:pointer; lda:longint);cdecl;
  Tcblas_zhpr2 = procedure(order:CBLAS_ORDER; Uplo:CBLAS_UPLO; N:longint; alpha:pointer; X:pointer; 
              incX:longint; Y:pointer; incY:longint; Ap:pointer);cdecl;
  {
   * ===========================================================================
   * Prototypes for level 3 BLAS
   * ===========================================================================
  }
  { 
   * Routines with standard 4 prefixes (S, D, C, Z)
  }
  Tcblas_sgemm = procedure(Order:CBLAS_ORDER; TransA:CBLAS_TRANSPOSE; TransB:CBLAS_TRANSPOSE; M:longint; N:longint; 
              K:longint; alpha:single; A:Psingle; lda:longint; B:Psingle; 
              ldb:longint; beta:single; C:Psingle; ldc:longint);cdecl;
  Tcblas_ssymm = procedure(Order:CBLAS_ORDER; Side:CBLAS_SIDE; Uplo:CBLAS_UPLO; M:longint; N:longint; 
              alpha:single; A:Psingle; lda:longint; B:Psingle; ldb:longint; 
              beta:single; C:Psingle; ldc:longint);cdecl;
  Tcblas_ssyrk = procedure(Order:CBLAS_ORDER; Uplo:CBLAS_UPLO; Trans:CBLAS_TRANSPOSE; N:longint; K:longint; 
              alpha:single; A:Psingle; lda:longint; beta:single; C:Psingle; 
              ldc:longint);cdecl;
  Tcblas_ssyr2k = procedure(Order:CBLAS_ORDER; Uplo:CBLAS_UPLO; Trans:CBLAS_TRANSPOSE; N:longint; K:longint; 
              alpha:single; A:Psingle; lda:longint; B:Psingle; ldb:longint; 
              beta:single; C:Psingle; ldc:longint);cdecl;
  Tcblas_strmm = procedure(Order:CBLAS_ORDER; Side:CBLAS_SIDE; Uplo:CBLAS_UPLO; TransA:CBLAS_TRANSPOSE; Diag:CBLAS_DIAG; 
              M:longint; N:longint; alpha:single; A:Psingle; lda:longint; 
              B:Psingle; ldb:longint);cdecl;
  Tcblas_strsm = procedure(Order:CBLAS_ORDER; Side:CBLAS_SIDE; Uplo:CBLAS_UPLO; TransA:CBLAS_TRANSPOSE; Diag:CBLAS_DIAG; 
              M:longint; N:longint; alpha:single; A:Psingle; lda:longint; 
              B:Psingle; ldb:longint);cdecl;
  Tcblas_dgemm = procedure(Order:CBLAS_ORDER; TransA:CBLAS_TRANSPOSE; TransB:CBLAS_TRANSPOSE; M:longint; N:longint; 
              K:longint; alpha:double; A:Pdouble; lda:longint; B:Pdouble; 
              ldb:longint; beta:double; C:Pdouble; ldc:longint);cdecl;
  Tcblas_dsymm = procedure(Order:CBLAS_ORDER; Side:CBLAS_SIDE; Uplo:CBLAS_UPLO; M:longint; N:longint; 
              alpha:double; A:Pdouble; lda:longint; B:Pdouble; ldb:longint; 
              beta:double; C:Pdouble; ldc:longint);cdecl;
  Tcblas_dsyrk = procedure(Order:CBLAS_ORDER; Uplo:CBLAS_UPLO; Trans:CBLAS_TRANSPOSE; N:longint; K:longint; 
              alpha:double; A:Pdouble; lda:longint; beta:double; C:Pdouble; 
              ldc:longint);cdecl;
  Tcblas_dsyr2k = procedure(Order:CBLAS_ORDER; Uplo:CBLAS_UPLO; Trans:CBLAS_TRANSPOSE; N:longint; K:longint; 
              alpha:double; A:Pdouble; lda:longint; B:Pdouble; ldb:longint; 
              beta:double; C:Pdouble; ldc:longint);cdecl;
  Tcblas_dtrmm = procedure(Order:CBLAS_ORDER; Side:CBLAS_SIDE; Uplo:CBLAS_UPLO; TransA:CBLAS_TRANSPOSE; Diag:CBLAS_DIAG; 
              M:longint; N:longint; alpha:double; A:Pdouble; lda:longint; 
              B:Pdouble; ldb:longint);cdecl;
  Tcblas_dtrsm = procedure(Order:CBLAS_ORDER; Side:CBLAS_SIDE; Uplo:CBLAS_UPLO; TransA:CBLAS_TRANSPOSE; Diag:CBLAS_DIAG; 
              M:longint; N:longint; alpha:double; A:Pdouble; lda:longint; 
              B:Pdouble; ldb:longint);cdecl;
  Tcblas_cgemm = procedure(Order:CBLAS_ORDER; TransA:CBLAS_TRANSPOSE; TransB:CBLAS_TRANSPOSE; M:longint; N:longint; 
              K:longint; alpha:pointer; A:pointer; lda:longint; B:pointer; 
              ldb:longint; beta:pointer; C:pointer; ldc:longint);cdecl;
  Tcblas_csymm = procedure(Order:CBLAS_ORDER; Side:CBLAS_SIDE; Uplo:CBLAS_UPLO; M:longint; N:longint; 
              alpha:pointer; A:pointer; lda:longint; B:pointer; ldb:longint; 
              beta:pointer; C:pointer; ldc:longint);cdecl;
  Tcblas_csyrk = procedure(Order:CBLAS_ORDER; Uplo:CBLAS_UPLO; Trans:CBLAS_TRANSPOSE; N:longint; K:longint; 
              alpha:pointer; A:pointer; lda:longint; beta:pointer; C:pointer; 
              ldc:longint);cdecl;
  Tcblas_csyr2k = procedure(Order:CBLAS_ORDER; Uplo:CBLAS_UPLO; Trans:CBLAS_TRANSPOSE; N:longint; K:longint; 
              alpha:pointer; A:pointer; lda:longint; B:pointer; ldb:longint; 
              beta:pointer; C:pointer; ldc:longint);cdecl;
  Tcblas_ctrmm = procedure(Order:CBLAS_ORDER; Side:CBLAS_SIDE; Uplo:CBLAS_UPLO; TransA:CBLAS_TRANSPOSE; Diag:CBLAS_DIAG; 
              M:longint; N:longint; alpha:pointer; A:pointer; lda:longint; 
              B:pointer; ldb:longint);cdecl;
  Tcblas_ctrsm = procedure(Order:CBLAS_ORDER; Side:CBLAS_SIDE; Uplo:CBLAS_UPLO; TransA:CBLAS_TRANSPOSE; Diag:CBLAS_DIAG; 
              M:longint; N:longint; alpha:pointer; A:pointer; lda:longint; 
              B:pointer; ldb:longint);cdecl;
  Tcblas_zgemm = procedure(Order:CBLAS_ORDER; TransA:CBLAS_TRANSPOSE; TransB:CBLAS_TRANSPOSE; M:longint; N:longint; 
              K:longint; alpha:pointer; A:pointer; lda:longint; B:pointer; 
              ldb:longint; beta:pointer; C:pointer; ldc:longint);cdecl;
  Tcblas_zsymm = procedure(Order:CBLAS_ORDER; Side:CBLAS_SIDE; Uplo:CBLAS_UPLO; M:longint; N:longint; 
              alpha:pointer; A:pointer; lda:longint; B:pointer; ldb:longint; 
              beta:pointer; C:pointer; ldc:longint);cdecl;
  Tcblas_zsyrk = procedure(Order:CBLAS_ORDER; Uplo:CBLAS_UPLO; Trans:CBLAS_TRANSPOSE; N:longint; K:longint; 
              alpha:pointer; A:pointer; lda:longint; beta:pointer; C:pointer; 
              ldc:longint);cdecl;
  Tcblas_zsyr2k = procedure(Order:CBLAS_ORDER; Uplo:CBLAS_UPLO; Trans:CBLAS_TRANSPOSE; N:longint; K:longint; 
              alpha:pointer; A:pointer; lda:longint; B:pointer; ldb:longint; 
              beta:pointer; C:pointer; ldc:longint);cdecl;
  Tcblas_ztrmm = procedure(Order:CBLAS_ORDER; Side:CBLAS_SIDE; Uplo:CBLAS_UPLO; TransA:CBLAS_TRANSPOSE; Diag:CBLAS_DIAG; 
              M:longint; N:longint; alpha:pointer; A:pointer; lda:longint; 
              B:pointer; ldb:longint);cdecl;
  Tcblas_ztrsm = procedure(Order:CBLAS_ORDER; Side:CBLAS_SIDE; Uplo:CBLAS_UPLO; TransA:CBLAS_TRANSPOSE; Diag:CBLAS_DIAG; 
              M:longint; N:longint; alpha:pointer; A:pointer; lda:longint; 
              B:pointer; ldb:longint);cdecl;
  { 
   * Routines with prefixes C and Z only
  }
  Tcblas_chemm = procedure(Order:CBLAS_ORDER; Side:CBLAS_SIDE; Uplo:CBLAS_UPLO; M:longint; N:longint; 
              alpha:pointer; A:pointer; lda:longint; B:pointer; ldb:longint; 
              beta:pointer; C:pointer; ldc:longint);cdecl;
  Tcblas_cherk = procedure(Order:CBLAS_ORDER; Uplo:CBLAS_UPLO; Trans:CBLAS_TRANSPOSE; N:longint; K:longint; 
              alpha:single; A:pointer; lda:longint; beta:single; C:pointer; 
              ldc:longint);cdecl;
  Tcblas_cher2k = procedure(Order:CBLAS_ORDER; Uplo:CBLAS_UPLO; Trans:CBLAS_TRANSPOSE; N:longint; K:longint; 
              alpha:pointer; A:pointer; lda:longint; B:pointer; ldb:longint; 
              beta:single; C:pointer; ldc:longint);cdecl;
  Tcblas_zhemm = procedure(Order:CBLAS_ORDER; Side:CBLAS_SIDE; Uplo:CBLAS_UPLO; M:longint; N:longint; 
              alpha:pointer; A:pointer; lda:longint; B:pointer; ldb:longint; 
              beta:pointer; C:pointer; ldc:longint);cdecl;
  Tcblas_zherk = procedure(Order:CBLAS_ORDER; Uplo:CBLAS_UPLO; Trans:CBLAS_TRANSPOSE; N:longint; K:longint; 
              alpha:double; A:pointer; lda:longint; beta:double; C:pointer; 
              ldc:longint);cdecl;
  Tcblas_zher2k = procedure(Order:CBLAS_ORDER; Uplo:CBLAS_UPLO; Trans:CBLAS_TRANSPOSE; N:longint; K:longint; 
              alpha:pointer; A:pointer; lda:longint; B:pointer; ldb:longint; 
              beta:double; C:pointer; ldc:longint);cdecl;
(* TODO
  procedure cblas_xerbla(p:longint; rout:Pchar; form:Pchar; args:array of const);cdecl;

  procedure cblas_xerbla(p:longint; rout:Pchar; form:Pchar);cdecl;
*)

function  InitializeCBLASANSI(Dependencies: array of string; const LibraryName: UnicodeString = ''): Integer; //needed as TLibraryLoadFunction
function  TryInitializeCBLAS(Dependencies:  array of string; const LibraryName: Unicodestring = ''): Integer;
function  InitializeCBLAS: Integer;
function  InitializeCBLAS(Dependencies:     array of string; const LibraryName: UnicodeString = ''): Integer;

function  ReleaseCBLAS: Integer;
procedure ReleaseCBLAS; //needed as TLibraryUnLoadFunction


var
  cblas_sdsdot: Tcblas_sdsdot;
  cblas_dsdot: Tcblas_dsdot;
  cblas_sdot: Tcblas_sdot;
  cblas_ddot: Tcblas_ddot;
  cblas_cdotu_sub: Tcblas_cdotu_sub;
  cblas_cdotc_sub: Tcblas_cdotc_sub;
  cblas_zdotu_sub: Tcblas_zdotu_sub;
  cblas_zdotc_sub: Tcblas_zdotc_sub;
  cblas_snrm2: Tcblas_snrm2;
  cblas_sasum: Tcblas_sasum;
  cblas_dnrm2: Tcblas_dnrm2;
  cblas_dasum: Tcblas_dasum;
  cblas_scnrm2: Tcblas_scnrm2;
  cblas_scasum: Tcblas_scasum;
  cblas_dznrm2: Tcblas_dznrm2;
  cblas_dzasum: Tcblas_dzasum;
  cblas_isamax: Tcblas_isamax;
  cblas_idamax: Tcblas_idamax;
  cblas_icamax: Tcblas_icamax;
  cblas_izamax: Tcblas_izamax;
  cblas_sswap: Tcblas_sswap;
  cblas_scopy: Tcblas_scopy;
  cblas_saxpy: Tcblas_saxpy;
  cblas_dswap: Tcblas_dswap;
  cblas_dcopy: Tcblas_dcopy;
  cblas_daxpy: Tcblas_daxpy;
  cblas_cswap: Tcblas_cswap;
  cblas_ccopy: Tcblas_ccopy;
  cblas_caxpy: Tcblas_caxpy;
  cblas_zswap: Tcblas_zswap;
  cblas_zcopy: Tcblas_zcopy;
  cblas_zaxpy: Tcblas_zaxpy;
  cblas_srotg: Tcblas_srotg;
  cblas_srotmg: Tcblas_srotmg;
  cblas_srot: Tcblas_srot;
  cblas_srotm: Tcblas_srotm;
  cblas_drotg: Tcblas_drotg;
  cblas_drotmg: Tcblas_drotmg;
  cblas_drot: Tcblas_drot;
  cblas_drotm: Tcblas_drotm;
  cblas_sscal: Tcblas_sscal;
  cblas_dscal: Tcblas_dscal;
  cblas_cscal: Tcblas_cscal;
  cblas_zscal: Tcblas_zscal;
  cblas_csscal: Tcblas_csscal;
  cblas_zdscal: Tcblas_zdscal;
  cblas_sgemv: Tcblas_sgemv;
  cblas_sgbmv: Tcblas_sgbmv;
  cblas_strmv: Tcblas_strmv;
  cblas_stbmv: Tcblas_stbmv;
  cblas_stpmv: Tcblas_stpmv;
  cblas_strsv: Tcblas_strsv;
  cblas_stbsv: Tcblas_stbsv;
  cblas_stpsv: Tcblas_stpsv;
  cblas_dgemv: Tcblas_dgemv;
  cblas_dgbmv: Tcblas_dgbmv;
  cblas_dtrmv: Tcblas_dtrmv;
  cblas_dtbmv: Tcblas_dtbmv;
  cblas_dtpmv: Tcblas_dtpmv;
  cblas_dtrsv: Tcblas_dtrsv;
  cblas_dtbsv: Tcblas_dtbsv;
  cblas_dtpsv: Tcblas_dtpsv;
  cblas_cgemv: Tcblas_cgemv;
  cblas_cgbmv: Tcblas_cgbmv;
  cblas_ctrmv: Tcblas_ctrmv;
  cblas_ctbmv: Tcblas_ctbmv;
  cblas_ctpmv: Tcblas_ctpmv;
  cblas_ctrsv: Tcblas_ctrsv;
  cblas_ctbsv: Tcblas_ctbsv;
  cblas_ctpsv: Tcblas_ctpsv;
  cblas_zgemv: Tcblas_zgemv;
  cblas_zgbmv: Tcblas_zgbmv;
  cblas_ztrmv: Tcblas_ztrmv;
  cblas_ztbmv: Tcblas_ztbmv;
  cblas_ztpmv: Tcblas_ztpmv;
  cblas_ztrsv: Tcblas_ztrsv;
  cblas_ztbsv: Tcblas_ztbsv;
  cblas_ztpsv: Tcblas_ztpsv;
  cblas_ssymv: Tcblas_ssymv;
  cblas_ssbmv: Tcblas_ssbmv;
  cblas_sspmv: Tcblas_sspmv;
  cblas_sger: Tcblas_sger;
  cblas_ssyr: Tcblas_ssyr;
  cblas_sspr: Tcblas_sspr;
  cblas_ssyr2: Tcblas_ssyr2;
  cblas_sspr2: Tcblas_sspr2;
  cblas_dsymv: Tcblas_dsymv;
  cblas_dsbmv: Tcblas_dsbmv;
  cblas_dspmv: Tcblas_dspmv;
  cblas_dger: Tcblas_dger;
  cblas_dsyr: Tcblas_dsyr;
  cblas_dspr: Tcblas_dspr;
  cblas_dsyr2: Tcblas_dsyr2;
  cblas_dspr2: Tcblas_dspr2;
  cblas_chemv: Tcblas_chemv;
  cblas_chbmv: Tcblas_chbmv;
  cblas_chpmv: Tcblas_chpmv;
  cblas_cgeru: Tcblas_cgeru;
  cblas_cgerc: Tcblas_cgerc;
  cblas_cher: Tcblas_cher;
  cblas_chpr: Tcblas_chpr;
  cblas_cher2: Tcblas_cher2;
  cblas_chpr2: Tcblas_chpr2;
  cblas_zhemv: Tcblas_zhemv;
  cblas_zhbmv: Tcblas_zhbmv;
  cblas_zhpmv: Tcblas_zhpmv;
  cblas_zgeru: Tcblas_zgeru;
  cblas_zgerc: Tcblas_zgerc;
  cblas_zher: Tcblas_zher;
  cblas_zhpr: Tcblas_zhpr;
  cblas_zher2: Tcblas_zher2;
  cblas_zhpr2: Tcblas_zhpr2;
  cblas_sgemm: Tcblas_sgemm;
  cblas_ssymm: Tcblas_ssymm;
  cblas_ssyrk: Tcblas_ssyrk;
  cblas_ssyr2k: Tcblas_ssyr2k;
  cblas_strmm: Tcblas_strmm;
  cblas_strsm: Tcblas_strsm;
  cblas_dgemm: Tcblas_dgemm;
  cblas_dsymm: Tcblas_dsymm;
  cblas_dsyrk: Tcblas_dsyrk;
  cblas_dsyr2k: Tcblas_dsyr2k;
  cblas_dtrmm: Tcblas_dtrmm;
  cblas_dtrsm: Tcblas_dtrsm;
  cblas_cgemm: Tcblas_cgemm;
  cblas_csymm: Tcblas_csymm;
  cblas_csyrk: Tcblas_csyrk;
  cblas_csyr2k: Tcblas_csyr2k;
  cblas_ctrmm: Tcblas_ctrmm;
  cblas_ctrsm: Tcblas_ctrsm;
  cblas_zgemm: Tcblas_zgemm;
  cblas_zsymm: Tcblas_zsymm;
  cblas_zsyrk: Tcblas_zsyrk;
  cblas_zsyr2k: Tcblas_zsyr2k;
  cblas_ztrmm: Tcblas_ztrmm;
  cblas_ztrsm: Tcblas_ztrsm;
  cblas_chemm: Tcblas_chemm;
  cblas_cherk: Tcblas_cherk;
  cblas_cher2k: Tcblas_cher2k;
  cblas_zhemm: Tcblas_zhemm;
  cblas_zherk: Tcblas_zherk;
  cblas_zher2k: Tcblas_zher2k;


implementation


uses dl;


var
  CBLASLibraryHandle: TLibHandle;
  CBLASDefaultLibrary: UnicodeString = CBLASLib;
  CBLASLoadedLibrary: UnicodeString;
  RefCount: Integer;
resourcestring
  SErrLoadFailed     = 'Can not load CBLAS client library "%s". Check your installation.';
  SErrAlreadyLoaded  = 'CBLAS interface already initialized from library %s.';

procedure LoadAddresses(LibHandle: TLibHandle);
begin
  pointer(cblas_sdsdot) := GetProcedureAddress(LibHandle,'cblas_sdsdot');
  pointer(cblas_dsdot)  := GetProcedureAddress(LibHandle,'cblas_dsdot');
  pointer(cblas_sdot)   := GetProcedureAddress(LibHandle,'cblas_sdot');
  pointer(cblas_ddot)   := GetProcedureAddress(LibHandle,'cblas_ddot');
  pointer(cblas_cdotu_sub) := GetProcedureAddress(LibHandle,'cblas_cdotu_sub');
  pointer(cblas_cdotc_sub) := GetProcedureAddress(LibHandle,'cblas_cdotc_sub');
  pointer(cblas_zdotu_sub) := GetProcedureAddress(LibHandle,'cblas_zdotu_sub');
  pointer(cblas_zdotc_sub) := GetProcedureAddress(LibHandle,'cblas_zdotc_sub');
  pointer(cblas_snrm2)  := GetProcedureAddress(LibHandle,'cblas_snrm2');
  pointer(cblas_sasum)  := GetProcedureAddress(LibHandle,'cblas_sasum');
  pointer(cblas_dnrm2)  := GetProcedureAddress(LibHandle,'cblas_dnrm2');
  pointer(cblas_dasum)  := GetProcedureAddress(LibHandle,'cblas_dasum');
  pointer(cblas_scnrm2) := GetProcedureAddress(LibHandle,'cblas_scnrm2');
  pointer(cblas_scasum) := GetProcedureAddress(LibHandle,'cblas_scasum');
  pointer(cblas_dznrm2) := GetProcedureAddress(LibHandle,'cblas_dznrm2');
  pointer(cblas_dzasum) := GetProcedureAddress(LibHandle,'cblas_dzasum');
  pointer(cblas_isamax) := GetProcedureAddress(LibHandle,'cblas_isamax');
  pointer(cblas_idamax) := GetProcedureAddress(LibHandle,'cblas_idamax');
  pointer(cblas_icamax) := GetProcedureAddress(LibHandle,'cblas_icamax');
  pointer(cblas_izamax) := GetProcedureAddress(LibHandle,'cblas_izamax');
  pointer(cblas_sswap)  := GetProcedureAddress(LibHandle,'cblas_sswap');
  pointer(cblas_scopy)  := GetProcedureAddress(LibHandle,'cblas_scopy');
  pointer(cblas_saxpy)  := GetProcedureAddress(LibHandle,'cblas_saxpy');
  pointer(cblas_dswap)  := GetProcedureAddress(LibHandle,'cblas_dswap');
  pointer(cblas_dcopy)  := GetProcedureAddress(LibHandle,'cblas_dcopy');
  pointer(cblas_daxpy)  := GetProcedureAddress(LibHandle,'cblas_daxpy');
  pointer(cblas_cswap)  := GetProcedureAddress(LibHandle,'cblas_cswap');
  pointer(cblas_ccopy)  := GetProcedureAddress(LibHandle,'cblas_ccopy');
  pointer(cblas_caxpy)  := GetProcedureAddress(LibHandle,'cblas_caxpy');
  pointer(cblas_zswap)  := GetProcedureAddress(LibHandle,'cblas_zswap');
  pointer(cblas_zcopy)  := GetProcedureAddress(LibHandle,'cblas_zcopy');
  pointer(cblas_zaxpy)  := GetProcedureAddress(LibHandle,'cblas_zaxpy');
  pointer(cblas_srotg)  := GetProcedureAddress(LibHandle,'cblas_srotg');
  pointer(cblas_srotmg) := GetProcedureAddress(LibHandle,'cblas_srotmg');
  pointer(cblas_srot)   := GetProcedureAddress(LibHandle,'cblas_srot');
  pointer(cblas_srotm)  := GetProcedureAddress(LibHandle,'cblas_srotm');
  pointer(cblas_drotg)  := GetProcedureAddress(LibHandle,'cblas_drotg');
  pointer(cblas_drotmg) := GetProcedureAddress(LibHandle,'cblas_drotmg');
  pointer(cblas_drot)   := GetProcedureAddress(LibHandle,'cblas_drot');
  pointer(cblas_drotm)  := GetProcedureAddress(LibHandle,'cblas_drotm');
  pointer(cblas_sscal)  := GetProcedureAddress(LibHandle,'cblas_sscal');
  pointer(cblas_dscal)  := GetProcedureAddress(LibHandle,'cblas_dscal');
  pointer(cblas_cscal)  := GetProcedureAddress(LibHandle,'cblas_cscal');
  pointer(cblas_zscal)  := GetProcedureAddress(LibHandle,'cblas_zscal');
  pointer(cblas_csscal) := GetProcedureAddress(LibHandle,'cblas_csscal');
  pointer(cblas_zdscal) := GetProcedureAddress(LibHandle,'cblas_zdscal');
  pointer(cblas_sgemv)  := GetProcedureAddress(LibHandle,'cblas_sgemv');
  pointer(cblas_sgbmv)  := GetProcedureAddress(LibHandle,'cblas_sgbmv');
  pointer(cblas_strmv)  := GetProcedureAddress(LibHandle,'cblas_strmv');
  pointer(cblas_stbmv)  := GetProcedureAddress(LibHandle,'cblas_stbmv');
  pointer(cblas_stpmv)  := GetProcedureAddress(LibHandle,'cblas_stpmv');
  pointer(cblas_strsv)  := GetProcedureAddress(LibHandle,'cblas_strsv');
  pointer(cblas_stbsv)  := GetProcedureAddress(LibHandle,'cblas_stbsv');
  pointer(cblas_stpsv)  := GetProcedureAddress(LibHandle,'cblas_stpsv');
  pointer(cblas_dgbmv)  := GetProcedureAddress(LibHandle,'cblas_dgbmv');
  pointer(cblas_dgemv)  := GetProcedureAddress(LibHandle,'cblas_dgemv');
  pointer(cblas_dgbmv)  := GetProcedureAddress(LibHandle,'cblas_dgbmv');
  pointer(cblas_dtrmv)  := GetProcedureAddress(LibHandle,'cblas_dtrmv');
  pointer(cblas_dtbmv)  := GetProcedureAddress(LibHandle,'cblas_dtbmv');
  pointer(cblas_dtpmv)  := GetProcedureAddress(LibHandle,'cblas_dtpmv');
  pointer(cblas_dtrsv)  := GetProcedureAddress(LibHandle,'cblas_dtrsv');
  pointer(cblas_dtbsv)  := GetProcedureAddress(LibHandle,'cblas_dtbsv');
  pointer(cblas_dtpsv)  := GetProcedureAddress(LibHandle,'cblas_dtpsv');
  pointer(cblas_cgemv)  := GetProcedureAddress(LibHandle,'cblas_cgemv');
  pointer(cblas_cgbmv)  := GetProcedureAddress(LibHandle,'cblas_cgbmv');
  pointer(cblas_ctrmv)  := GetProcedureAddress(LibHandle,'cblas_ctrmv');
  pointer(cblas_ctbmv)  := GetProcedureAddress(LibHandle,'cblas_ctbmv');
  pointer(cblas_ctpmv)  := GetProcedureAddress(LibHandle,'cblas_ctpmv');
  pointer(cblas_ctrsv)  := GetProcedureAddress(LibHandle,'cblas_ctrsv');
  pointer(cblas_ctbsv)  := GetProcedureAddress(LibHandle,'cblas_ctbsv');
  pointer(cblas_ctpsv)  := GetProcedureAddress(LibHandle,'cblas_ctpsv');
  pointer(cblas_zgemv)  := GetProcedureAddress(LibHandle,'cblas_zgemv');
  pointer(cblas_zgbmv)  := GetProcedureAddress(LibHandle,'cblas_zgbmv');
  pointer(cblas_ztrmv)  := GetProcedureAddress(LibHandle,'cblas_ztrmv');
  pointer(cblas_ztbmv)  := GetProcedureAddress(LibHandle,'cblas_ztbmv');
  pointer(cblas_ztpmv)  := GetProcedureAddress(LibHandle,'cblas_ztpmv');
  pointer(cblas_ztrsv)  := GetProcedureAddress(LibHandle,'cblas_ztrsv');
  pointer(cblas_ztbsv)  := GetProcedureAddress(LibHandle,'cblas_ztbsv');
  pointer(cblas_ztpsv)  := GetProcedureAddress(LibHandle,'cblas_ztpsv');
  pointer(cblas_ssymv)  := GetProcedureAddress(LibHandle,'cblas_ssymv');
  pointer(cblas_ssbmv)  := GetProcedureAddress(LibHandle,'cblas_ssbmv');
  pointer(cblas_sspmv)  := GetProcedureAddress(LibHandle,'cblas_sspmv');
  pointer(cblas_sger)   := GetProcedureAddress(LibHandle,'cblas_sger');
  pointer(cblas_ssyr)   := GetProcedureAddress(LibHandle,'cblas_ssyr');
  pointer(cblas_sspr)   := GetProcedureAddress(LibHandle,'cblas_sspr');
  pointer(cblas_ssyr2)  := GetProcedureAddress(LibHandle,'cblas_ssyr2');
  pointer(cblas_sspr2)  := GetProcedureAddress(LibHandle,'cblas_sspr2');
  pointer(cblas_dsymv)  := GetProcedureAddress(LibHandle,'cblas_dsymv');
  pointer(cblas_dsbmv)  := GetProcedureAddress(LibHandle,'cblas_dsbmv');
  pointer(cblas_dspmv)  := GetProcedureAddress(LibHandle,'cblas_dspmv');
  pointer(cblas_dger)   := GetProcedureAddress(LibHandle,'cblas_dger');
  pointer(cblas_dsyr)   := GetProcedureAddress(LibHandle,'cblas_dsyr');
  pointer(cblas_dspr)   := GetProcedureAddress(LibHandle,'cblas_dspr');
  pointer(cblas_dsyr2)  := GetProcedureAddress(LibHandle,'cblas_dsyr2');
  pointer(cblas_dspr2)  := GetProcedureAddress(LibHandle,'cblas_dspr2');
  pointer(cblas_chemv)  := GetProcedureAddress(LibHandle,'cblas_chemv');
  pointer(cblas_chbmv)  := GetProcedureAddress(LibHandle,'cblas_chbmv');
  pointer(cblas_chpmv)  := GetProcedureAddress(LibHandle,'cblas_chpmv');
  pointer(cblas_cgeru)  := GetProcedureAddress(LibHandle,'cblas_cgeru');
  pointer(cblas_cgerc)  := GetProcedureAddress(LibHandle,'cblas_cgerc');
  pointer(cblas_cher)   := GetProcedureAddress(LibHandle,'cblas_cher');
  pointer(cblas_chpr)   := GetProcedureAddress(LibHandle,'cblas_chpr');
  pointer(cblas_cher2)  := GetProcedureAddress(LibHandle,'cblas_cher2');
  pointer(cblas_chpr2)  := GetProcedureAddress(LibHandle,'cblas_chpr2');
  pointer(cblas_zhemv)  := GetProcedureAddress(LibHandle,'cblas_zhemv');
  pointer(cblas_zhbmv)  := GetProcedureAddress(LibHandle,'cblas_zhbmv');
  pointer(cblas_zhpmv)  := GetProcedureAddress(LibHandle,'cblas_zhpmv');
  pointer(cblas_zgeru)  := GetProcedureAddress(LibHandle,'cblas_zgeru');
  pointer(cblas_zgerc)  := GetProcedureAddress(LibHandle,'cblas_zgerc');
  pointer(cblas_zher)   := GetProcedureAddress(LibHandle,'cblas_zher');
  pointer(cblas_zhpr)   := GetProcedureAddress(LibHandle,'cblas_zhpr');
  pointer(cblas_zher2)  := GetProcedureAddress(LibHandle,'cblas_zher2');
  pointer(cblas_zhpr2)  := GetProcedureAddress(LibHandle,'cblas_zhpr2');
  pointer(cblas_sgemm)  := GetProcedureAddress(LibHandle,'cblas_sgemm');
  pointer(cblas_ssymm)  := GetProcedureAddress(LibHandle,'cblas_ssymm');
  pointer(cblas_ssyrk)  := GetProcedureAddress(LibHandle,'cblas_ssyrk');
  pointer(cblas_ssyr2k) := GetProcedureAddress(LibHandle,'cblas_ssyr2k');
  pointer(cblas_strmm)  := GetProcedureAddress(LibHandle,'cblas_strmm');
  pointer(cblas_strsm)  := GetProcedureAddress(LibHandle,'cblas_strsm');
  pointer(cblas_dgemm)  := GetProcedureAddress(LibHandle,'cblas_dgemm');
  pointer(cblas_dsymm)  := GetProcedureAddress(LibHandle,'cblas_dsymm');
  pointer(cblas_dsyrk)  := GetProcedureAddress(LibHandle,'cblas_dsyrk');
  pointer(cblas_dsyr2k) := GetProcedureAddress(LibHandle,'cblas_dsyr2k');
  pointer(cblas_dtrmm)  := GetProcedureAddress(LibHandle,'cblas_dtrmm');
  pointer(cblas_dtrsm)  := GetProcedureAddress(LibHandle,'cblas_dtrsm');
  pointer(cblas_cgemm)  := GetProcedureAddress(LibHandle,'cblas_cgemm');
  pointer(cblas_csymm)  := GetProcedureAddress(LibHandle,'cblas_csymm');
  pointer(cblas_csyrk)  := GetProcedureAddress(LibHandle,'cblas_csyrk');
  pointer(cblas_csyr2k) := GetProcedureAddress(LibHandle,'cblas_csyr2k');
  pointer(cblas_ctrmm)  := GetProcedureAddress(LibHandle,'cblas_ctrmm');
  pointer(cblas_ctrsm)  := GetProcedureAddress(LibHandle,'cblas_ctrsm');
  pointer(cblas_zgemm)  := GetProcedureAddress(LibHandle,'cblas_zgemm');
  pointer(cblas_zsymm)  := GetProcedureAddress(LibHandle,'cblas_zsymm');
  pointer(cblas_zsyrk)  := GetProcedureAddress(LibHandle,'cblas_zsyrk');
  pointer(cblas_zsyr2k) := GetProcedureAddress(LibHandle,'cblas_zsyr2k');
  pointer(cblas_ztrmm)  := GetProcedureAddress(LibHandle,'cblas_ztrmm');
  pointer(cblas_ztrsm)  := GetProcedureAddress(LibHandle,'cblas_ztrsm');
  pointer(cblas_chemm)  := GetProcedureAddress(LibHandle,'cblas_chemm');
  pointer(cblas_cherk)  := GetProcedureAddress(LibHandle,'cblas_cherk');
  pointer(cblas_cher2k) := GetProcedureAddress(LibHandle,'cblas_cher2k');
  pointer(cblas_zhemm)  := GetProcedureAddress(LibHandle,'cblas_zhemm');
  pointer(cblas_zherk)  := GetProcedureAddress(LibHandle,'cblas_zherk');
  pointer(cblas_zher2k) := GetProcedureAddress(LibHandle,'cblas_zher2k');
end;


function TryLoadAllDependencies(Dependencies: array of string): Integer;
var
   lib: TLibHandle; 
   i:   integer;
   Dep: string;
begin
  result := 0;
  if Length(Dependencies)>0 then
  begin
      for i:=Low(Dependencies) to High(Dependencies) do
      begin
          Dep := Dependencies[i];
          { TODO: adapt this part to OSX and Windows }
          { TODO:  this is a memory leak. Put in a list and release on exit....}

          lib := TLibHandle(dlopen(PAnsiChar(Dep), RTLD_LAZY or RTLD_GLOBAL));
          if lib = NilHandle then
	  begin
            result := -1;
          end;
      end;
  end;
end;

function TryInitializeCBLAS(Dependencies: array of string; const LibraryName: UnicodeString): Integer;
var
  N  : UnicodeString;
begin
  N:=LibraryName;
  if (N='') then
    N:=CBLASDefaultLibrary;
  result:=InterlockedIncrement(RefCount);

  { Preload depedencies } 
  TryLoadAllDependencies(Dependencies);

  { Load the shared library/dll and initialize the pointers }
  if result  = 1 then
  begin
    CBLASLibraryHandle := LoadLibrary(N);
    if (CBLASLibraryHandle = NilHandle) then
    begin
      RefCount := 0;
      Exit(-1);
    end;
    CBLASLoadedLibrary := N;
    LoadAddresses(CBLASLibraryHandle);
  end;
end;

function InitializeCBLAS:integer;
begin
  result:=InitializeCBLAS([], CBLASDefaultLibrary);
end;


function  InitializeCBLASANSI(Dependencies: array of string; const LibraryName: UnicodeString):integer;
begin
  result:=InitializeCBLAS(Dependencies, LibraryName);
end;

function  InitializeCBLAS(Dependencies: array of string; const LibraryName: UnicodeString) :integer;
begin
  if (LibraryName<>'') and (CBLASLoadedLibrary <> '') and (CBLASLoadedLibrary <> LibraryName) then
    raise EInoutError.CreateFmt(SErrAlreadyLoaded,[CBLASLoadedLibrary]);

  result:= TryInitializeCBLAS(Dependencies, LibraryName);
  if result=-1 then
    if LibraryName='' then
      raise EInOutError.CreateFmt(SErrLoadFailed,[CBLASDefaultLibrary])
    else
      raise EInOutError.CreateFmt(SErrLoadFailed,[LibraryName]);
end;

function  ReleaseCBLAS:integer;
begin
  result := RefCount;;
  if InterlockedDecrement(RefCount) <= 0 then
  begin
    if CBLASLibraryHandle <> NilHandle then
      UnloadLibrary(CBLASLibraryHandle);
    CBLASLibraryHandle := NilHandle;
    CBLASLoadedLibrary := '';
    RefCount := 0;
    result   := 0;
  end;
end;

procedure ReleaseCBLAS;
begin
  ReleaseCBLAS;
end;

end.
