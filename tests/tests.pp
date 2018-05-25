program tests;

{$mode objfpc}

uses
  consoletestrunner, TestsCBLAS, cblas;

var
  Application: TTestRunner;
begin
  Application := TTestRunner.Create(nil);
  Application.Initialize;
  Application.Run;
  Application.Free;
end.

