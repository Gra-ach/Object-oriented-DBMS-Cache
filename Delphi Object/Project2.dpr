program Project2;

uses
  Vcl.Forms,
  Unit1 in 'Unit1.pas' {Form1},
  CacheActiveX_TLB in 'CacheActiveX_TLB.pas';

{$R *.res}

begin
  Application.Initialize;
  Application.MainFormOnTaskbar := True;
  Application.CreateForm(TForm1, Form1);
  Application.Run;
end.