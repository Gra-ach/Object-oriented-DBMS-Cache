unit Unit1;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.Grids, Vcl.StdCtrls, Vcl.ExtCtrls, CacheActiveX_TLB,
  Vcl.AxCtrls, Winapi.ActiveX;

type
  TForm1 = class(TForm)
    Panel1: TPanel;
    BConnect: TButton;
    BDisconnect: TButton;
    BSelect: TButton;
    Panel3: TPanel;
    Panel2: TPanel;
    GroupsTopics: TStringGrid;
    Participants: TDrawGrid;
    Log: TStringGrid;
    CallMethod: TButton;
    procedure BConnectClick(Sender: TObject);
    procedure BDisconnectClick(Sender: TObject);
    procedure BSelectClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure GroupsTopicsSelectCell(Sender: TObject; ACol, ARow: Integer;
      var CanSelect: Boolean);
    procedure CallMethodClick(Sender: TObject);
    procedure Button1Click(Sender: TObject);
  private
    { Private declarations }
    V: IFactory;
    procedure DrawText(x,y:integer; text:string);
  public
    { Public declarations }
  end;

const SQLSelect = 'select %ID, Topic->Name, $listtostring(Topic->Technologies, '', '') Tech, Leader->FullName'
                + ' from Contest."Group"';

var
  Form1: TForm1;

implementation

{$R *.dfm}

procedure TForm1.BConnectClick(Sender: TObject);
var cString:string;
begin
   cString := v.ConnectDlg('З’єднання з БД');
   if (cString <> EmptyStr) then
      if (V.Connect(cString)) then
         showmessage('З’єднання виконано успішно');
end;

procedure TForm1.BDisconnectClick(Sender: TObject);
begin
   if v.IsConnected then
      v.Disconnect;
end;

procedure TForm1.BSelectClick(Sender: TObject);
var grid : IResultSet;
    i:integer;
begin
   if not v.IsConnected then exit;

   GroupsTopics.RowCount := 2;
   grid := IResultSet(v.DynamicSQL(SQLSelect));
   grid.Prepare(null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
   grid.Execute(null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
   i:= 1;
   while grid.Next do
   begin
      GroupsTopics.Cells[0,i] := grid.GetDataByName('ID');
      GroupsTopics.Cells[1,i] := grid.GetDataByName('Name');
      GroupsTopics.Cells[2,i] := grid.GetDataByName('Tech');
      GroupsTopics.Cells[3,i] := grid.GetDataByName('FullName');
      GroupsTopics.RowCount := GroupsTopics.RowCount + 1;
      i := i+1;
   end;
   if GroupsTopics.RowCount > 1 then
      GroupsTopics.RowCount := GroupsTopics.RowCount - 1;
   grid.Close;
end;

procedure TForm1.Button1Click(Sender: TObject);
var h:variant;
begin
   //v.SetOutput(Edit1.Text);
   h := v.OpenId('Contest.Participant','1',0);
   showmessage(h.sys_OID);
   //showmessage(h.PrintInfo);
end;

procedure TForm1.CallMethodClick(Sender: TObject);
var cl1, cl2:variant;
begin
   if not v.IsConnected then exit;

   cl1 := v.Static('Contest.Participant');
   cl2 := v.Static('Contest.PopulateUtils');
   cl1.CreateParticipant('Name', 'Surname', cl2.GenPhoto, 5, 'CompanyName', 'CompanyCountry');
end;

procedure TForm1.FormCreate(Sender: TObject);
var rect:TRect;
begin
   V := CoFactory.Create;

   GroupsTopics.Cells[0,0] := 'Ідентифікатор';
   GroupsTopics.Cells[1,0] := 'Назва проекту';
   GroupsTopics.Cells[2,0] := 'Мови та технології';
   GroupsTopics.Cells[3,0] := 'Лідер групи';

   Log.Cells[0,0] := 'Час';
   Log.Cells[1,0] := 'Примітка';

   DrawText(0, 0, 'Ім’я');
   DrawText(1, 0, 'Назва компанії');
   DrawText(2, 0, 'Країна');
   DrawText(3, 0, 'Фото');
   DrawText(4, 0, 'Контактні дані');
end;

procedure TForm1.DrawText(x,y:integer; text:string);
var rect:TRect;
begin
   rect := Participants.CellRect(x, y);
   Participants.Canvas.FillRect(Rect);
   Participants.Canvas.TextOut(Rect.Left + 2, Rect.Top + 2, text);
end;

procedure TForm1.GroupsTopicsSelectCell(Sender: TObject; ACol, ARow: Integer;
  var CanSelect: Boolean);
var group:variant;
    i, j:integer;
    rect:TRect;
    stream: IDispatch;
    img:TImage;
    buf, key:string;
    st:TStringStream;
    fs:TFileStream;
    bb:WideString;
begin
  if not v.IsConnected then exit;

  if GroupsTopics.Cells[0,ARow] = EmptyStr then exit;

  group := v.OpenEx('Contest.Group', GroupsTopics.Cells[0,ARow],0);

  Log.RowCount := group.Topic.Progress.Count + 1;
  log.FixedRows := 1;
  for i:=1 to group.Topic.Progress.Count do
  begin
     Log.Cells[0,i] := DateTimeToStr(group.Topic.Progress.GetAt(i).TS);
     Log.Cells[1,i] := group.Topic.Progress.GetAt(i).Note;
  end;

  Participants.RowCount := group.Participants.Count + 1;
  Participants.FixedRows := 1;
  for i:=1 to group.Participants.Count do
  begin
     Participants.RowHeights[i] := 28;

     DrawText(0, i, group.Participants.GetAt(i).FullName);
     DrawText(1, i, group.Participants.GetAt(i).Company.Name);
     DrawText(2, i, group.Participants.GetAt(i).Company.Country);

     rect := Participants.CellRect(3, i);
     Participants.Canvas.FillRect(Rect);
     img := TImage.Create(self);
     stream := group.Participants.GetAt(i).Photo;
     if IBinaryStream(stream).size = 0 then continue;
     //SetOlePicture(img.Picture, IBinaryStream(stream).GetPicture);
     //Participants.Canvas.Draw(Rect.Left+2, Rect.Top+2, img.Picture.Graphic);

     //st := TStringStream.Create;
     //st.LoadFromFile('C:\Users\Gra-ach\Pictures\Avatars\13.jpg');
     //bb := st.DataString;
     //st.WriteString(IBinaryStream(stream).Read(IBinaryStream(stream).size));
     //IBinaryStream(stream).Write(bb);
     //SetOlePicture(img.Picture, IBinaryStream(stream).GetPicture);
     //Participants.Canvas.Draw(Rect.Left+2, Rect.Top+2, img.Picture.Graphic);
     //Image1.Picture.Bitmap.LoadFromStream(IBinaryStream(stream).);
     FreeAndNil(st);


     stream := nil;
     //Participants.Canvas.Draw(Rect.Left+2, Rect.Top+2, img.Picture.Graphic);

     buf := EmptyStr;
     key := group.Participants.GetAt(i).Contacts.Next('');
     while key <> EmptyStr do
     begin
        buf := buf+key+': '+group.Participants.GetAt(i).Contacts.GetAt(key)+' ';
        key := group.Participants.GetAt(i).Contacts.Next(key);
     end;
     DrawText(4, i, buf);
  end;

  group := null;
  v.ForceSync;
end;

end.
