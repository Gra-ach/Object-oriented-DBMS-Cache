program Project1;

uses
  Forms,
  Unit1 in 'Unit1.pas' {Form1},
  VISMLib_TLB in '..\..\5.0\Imports\VISMLib_TLB.pas';

{$R *.res}

begin
  Application.Initialize;
  Application.MainFormOnTaskbar := True;
  Application.CreateForm(TForm1, Form1);
  Application.Run;
end.
