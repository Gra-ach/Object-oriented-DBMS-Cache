unit Unit1;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, VISMLib_TLB, StdCtrls, ExtCtrls, ComCtrls;

type
  TForm1 = class(TForm)
    Button0: TButton;
    Memo1: TMemo;
    Panel1: TPanel;
    Button1: TButton;
    Panel2: TPanel;
    Panel3: TPanel;
    Button2: TButton;
    ComboBox1: TComboBox;
    Label1: TLabel;
    Button3: TButton;
    Label2: TLabel;
    ComboBox2: TComboBox;
    ListBox1: TListBox;
    Label4: TLabel;
    procedure Button0Click(Sender: TObject);
    procedure Button1Click(Sender: TObject);
    procedure Button2Click(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure Button3Click(Sender: TObject);
    procedure ComboBox1Change(Sender: TObject);
    procedure ComboBox2Change(Sender: TObject);
  private
    { Private declarations }
    VisM1: TVisM;
    procedure CheckError(Sender:TObject);
    procedure GetListFromString(aString: string; aStrings:TStrings);
  public
    { Public declarations }
  end;

var
  Form1: TForm1;

implementation

{$R *.dfm}

procedure TForm1.ComboBox1Change(Sender: TObject);
begin
   VisM1.PLIST := ComboBox1.Text;
   VisM1.Execute('do GetYear^SeriesDelphi');
   if VisM1.PLIST <> EmptyStr then
      GetListFromString(VisM1.PLIST, ComboBox2.Items);
end;

procedure TForm1.ComboBox2Change(Sender: TObject);
begin
   VisM1.P0 := ComboBox1.Text;
   VisM1.P1 := ComboBox2.Text;
   VisM1.Execute('do GetActorsListForSeries^SeriesDelphi(P0,P1)');
   GetListFromString(VisM1.VALUE, ListBox1.Items);
end;

procedure TForm1.Button0Click(Sender: TObject);
begin
   VisM1 := TVisM.Create(Self);
   VisM1.Connect('CN_IPTCP:localhost[1972]:_system:@SYS');
   VisM1.ErrorTrap := true;
   VisM1.NameSpace := 'USER';
   VisM1.OnError := CheckError;

   VisM1.Execute('$$GetClientIP^%CDSrv()');
   Memo1.Lines.Add('ClientIP = '+VisM1.VALUE);
   VisM1.Execute('=$$MsgBox^%CDSrv("Are you finished?",1)');
   Memo1.Lines.Add('Message = '+VisM1.VALUE);
end;

procedure TForm1.FormClose(Sender: TObject; var Action: TCloseAction);
begin
   Button1.Click;
end;

procedure TForm1.GetListFromString(aString: string; aStrings:TStrings);
begin
   aStrings.Clear;
   aStrings.Delimiter := '/';
   aStrings.StrictDelimiter := true;
   aStrings.DelimitedText := aString;
end;

procedure TForm1.Button1Click(Sender: TObject);
begin
   if (VisM1 <> nil) and (VisM1.Server <> EmptyStr) then
   begin
     VisM1.Server := EmptyStr;
     VisM1.DeleteConnection();
   end;
end;

procedure TForm1.Button2Click(Sender: TObject);
var buf:TStringList;
begin
   VisM1.PDELIM := '/';
   VisM1.Execute('do GetAllSeriesNames^SeriesDelphi');
   if VisM1.PLIST <> EmptyStr then
      GetListFromString(VisM1.PLIST, ComboBox1.Items);
end;

procedure TForm1.Button3Click(Sender: TObject);
begin
   VisM1.Code := 'kill ^Series';
   VisM1.ExecFlag := 1;

   VisM1.Code := 'do CreateGlobal^SeriesDelphi';
   VisM1.ExecFlag := 1;

   VisM1.Execute('set ^Series("Sherlock") = "A modern update finds the famous sleuth and his doctor partner solving crime in 21st century London."');
   VisM1.Execute('set ^Series("Sherlock", 2010) = $lb("Benedict Cumberbatch", "Martin Freeman", "Una Stubbs", "Rupert Graves") ');
end;

procedure TForm1.CheckError(Sender: TObject);
begin
   If VisM1.Error <> 0 Then
      Memo1.Lines.Add('Помилка '+inttostr(VisM1.Error)+': '+VisM1.ErrorName);
end;

end.
