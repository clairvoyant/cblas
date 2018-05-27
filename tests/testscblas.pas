
unit TestsCBLAS;

{$mode objfpc}{$H+}

interface

uses
  cblas, FPCUnit, TestRegistry;

type

  { TTestHMACMD5 }

  TTestBlas = class(TTestCase)
  published
    procedure TestBasicProcedureLoad;
    procedure TestOpenBlas;
    procedure TestNetlibBlas;
    procedure TestAtlas;
procedure     TestMKL;
  end;

implementation

{ TTestBlas }

procedure PrintMatrix(name: string; A: array of double; m,n: integer);
var
   i,j: integer;
begin
    WriteLn(name, ' = ');
    for i:=0 to m-1 do
    begin
        Write('  ');
        for j:=0 to n-1 do
	begin
	     Write(A[i*n+j]:5:3, ' ');
	end;
	WriteLn;
   end;
   WriteLn;
end;

procedure TTestBlas.TestBasicProcedureLoad;
begin
  InitializeCBLAS;

  AssertNotNull('function not found:', cblas_sdsdot);
  AssertNotNull('function not found:', cblas_sgemm);
  AssertNotNull('function not found:', cblas_dgemm);
  AssertNotNull('function not found:', cblas_cgemm);
  AssertNotNull('function not found:', cblas_zgemm);
  
  ReleaseCBLAS;
end;

procedure TTestBlas.TestOpenBlas;
var
  m,n,k: integer;

  { 3x2 matrix (m * k)  }
  A: array[0..5] of double = (  1.0, 2.0 , 3.0, 4.0 , 5.0, 6.0);
  { 2x3 matrix (k * n)  }
  B: array[0..5] of double = ( 1.0,  2.0, 3.0, 4.0,  5.0, 6.0);
  { 3x3 matrix (m * n)  }
  C: array[0..8] of double = ( 0.1, 0.2, 0.3, 0.4, 0.5, 0.6, 0.7, 0.8, 0.9  );
begin
     m := 3;
     k := 2;
     n := 3;
     
     InitializeCBLAS;
     PrintMatrix('A', A,m,k);
     PrintMatrix('B', B,k,n);
     PrintMatrix('C', C,m,n);


     AssertNotNull('function not found:', cblas_dgemm);
     cblas_dgemm(CblasRowMajor, CblasNoTrans, CblasNoTrans,
              m,n,k, { m, n, k }
              1,     { alpha   }
                A, k,
                B, n,
              1,
                C,n  
             );

     PrintMatrix('Result', C, m, n);
     ReleaseCBLAS;
end;


procedure TTestBlas.TestNetlibBlas;
var
  m,n,k: integer;

  { 3x2 matrix (m * k)  }
  A: array[0..5] of double = (  1.0, 2.0 , 3.0, 4.0 , 5.0, 6.0);
  { 2x3 matrix (k * n)  }
  B: array[0..5] of double = ( 1.0,  2.0, 3.0, 4.0,  5.0, 6.0);
  { 3x3 matrix (m * n)  }
  C: array[0..8] of double = ( 0.1, 0.2, 0.3, 0.4, 0.5, 0.6, 0.7, 0.8, 0.9  );
begin
     m := 3;
     k := 2;
     n := 3;
     
     InitializeCBLAS(['libblas.so'], 'libcblas.so.3');
     PrintMatrix('A', A,m,k);
     PrintMatrix('B', B,k,n);
     PrintMatrix('C', C,m,n);


     AssertNotNull('cblas_dgemm not found:', cblas_dgemm);
     cblas_dgemm(CblasRowMajor, CblasNoTrans, CblasNoTrans,
              m,n,k, { m, n, k }
              1,     { alpha   }
                A, k,
                B, n,
              1,
                C,n  
             );

     PrintMatrix('Result', C, m, n);
     ReleaseCBLAS;
end;


procedure TTestBlas.TestAtlas;
var
  m,n,k: integer;

  { 3x2 matrix (m * k)  }
  A: array[0..5] of double = (  1.0, 2.0 , 3.0, 4.0 , 5.0, 6.0);
  { 2x3 matrix (k * n)  }
  B: array[0..5] of double = ( 1.0,  2.0, 3.0, 4.0,  5.0, 6.0);
  { 3x3 matrix (m * n)  }
  C: array[0..8] of double = ( 0.1, 0.2, 0.3, 0.4, 0.5, 0.6, 0.7, 0.8, 0.9  );
begin
     m := 3;
     k := 2;
     n := 3;
     
     InitializeCBLAS([], 'libcblas.so.3');
     PrintMatrix('A', A,m,k);
     PrintMatrix('B', B,k,n);
     PrintMatrix('C', C,m,n);


     AssertNotNull('cblas_dgemm not found:', cblas_dgemm);
     cblas_dgemm(CblasRowMajor, CblasNoTrans, CblasNoTrans,
              m,n,k, { m, n, k }
              1,     { alpha   }
                A, k,
                B, n,
              1,
                C,n  
             );

     PrintMatrix('Result', C, m, n);
     ReleaseCBLAS;
end;


procedure TTestBlas.TestMKL;
var
  m,n,k: integer;

  { 3x2 matrix (m * k)  }
  A: array[0..5] of double = (  1.0, 2.0 , 3.0, 4.0 , 5.0, 6.0);
  { 2x3 matrix (k * n)  }
  B: array[0..5] of double = ( 1.0,  2.0, 3.0, 4.0,  5.0, 6.0);
  { 3x3 matrix (m * n)  }
  C: array[0..8] of double = ( 0.1, 0.2, 0.3, 0.4, 0.5, 0.6, 0.7, 0.8, 0.9  );
begin
     m := 3;
     k := 2;
     n := 3;
     
     InitializeCBLAS([], 'mkl_rt.dll');
     PrintMatrix('A', A,m,k);
     PrintMatrix('B', B,k,n);
     PrintMatrix('C', C,m,n);


     AssertNotNull('cblas_dgemm not found:', cblas_dgemm);
     cblas_dgemm(CblasRowMajor, CblasNoTrans, CblasNoTrans,
              m,n,k, { m, n, k }
              1,     { alpha   }
                A, k,
                B, n,
              1,
                C,n  
             );

     PrintMatrix('Result', C, m, n);
     ReleaseCBLAS;
end;







initialization
  RegisterTest(TTestBlas);
end.

