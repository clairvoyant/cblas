{$ifndef ALLPACKAGES}
{$mode objfpc}{$H+}
program fpmake;

uses fpmkunit;

Var
  P : TPackage;
  T : TTarget;
begin
  With Installer do
    begin
{$endif ALLPACKAGES}

    P:=AddPackage('cblas');
    P.ShortName:='cblas';
{$ifdef ALLPACKAGES}
    P.Directory:=ADirectory;
{$endif ALLPACKAGES}


    P.Version:='0.0.1';
    P.OSes := AllUnixOSes+AllWindowsOSes-[qnx];

    { unit code } 
    P.SourcePath.Add('src');
    P.IncludePath.Add('src');

    T:=P.Targets.AddUnit('cblas.pas');

    { unit tests } 
    P.SourcePath.Add('tests');
    P.ExamplePath.Add('tests/');
    T:=P.Targets.AddUnit('tests.pp');

    T.ResourceStrings := True;
    // P.Targets.AddExampleProgram('testapiv3x.pp');
    // P.Targets.AddExampleProgram('test.pas');

{$ifndef ALLPACKAGES}
    Run;
    end;
end.
{$endif ALLPACKAGES}
