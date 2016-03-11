unit Unit1;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.ExtCtrls, Vcl.Grids, Vcl.StdCtrls, ComObj, ActiveX, CacheActiveX_TLB,
  Vcl.ComCtrls;

type
  TForm1 = class(TForm)
    BConnect: TButton;
    BDisconnect: TButton;
    AlbumsGrid: TStringGrid;
    Panel1: TPanel;
    Panel2: TPanel;
    Panel3: TPanel;
    SongsGrid: TStringGrid;
    SingerGrid: TStringGrid;
    BSelect: TButton;
    procedure BConnectClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure BDisconnectClick(Sender: TObject);
    procedure BSelectClick(Sender: TObject);
    procedure AlbumsGridSelectCell(Sender: TObject; ACol, ARow: Integer;
      var CanSelect: Boolean);
  private
    { Private declarations }
    V: IFactory;
  end;

const SQLSelect = 'select a.ID, '+
                  '       a.Name, '+
                  '       a.Year, '+
                  '      (select g.Name '+
                  '         from MusicIndustry."Group" g '+
                  '        WHERE FOR SOME %ELEMENT(g.Albums) (%Value = a.ID)) GroupName, '+
                  '       a.Label -> Name LabelName, '+
                  '       a.Label -> Address_City LabelCity '+
                  '  from MusicIndustry.Album a '+
                  'order by GroupName, a.Year ';

var form1:TForm1;

implementation

{$R *.dfm}

procedure TForm1.AlbumsGridSelectCell(Sender: TObject; ACol, ARow: Integer;
  var CanSelect: Boolean);
var grid1, grid2, colnames : IResultSet; i, j:integer;
begin
   SongsGrid.RowCount := 2;
   SongsGrid.FixedRows := 1;
   grid1 := IResultSet(v.ResultSet('MusicIndustry.Album', 'GetSongsInAlbum'));
   grid1.Execute(AlbumsGrid.Cells[0,ARow], null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
   SongsGrid.ColCount := grid1.GetColumnCount;
   for i := 0 to grid1.GetColumnCount - 1 do
      SongsGrid.Cells[i,0] := grid1.GetColumnName(i+1);
   j := 1;
   while grid1.Next do
   begin
     for i := 0 to grid1.GetColumnCount - 1 do
        SongsGrid.Cells[i,j] := grid1.GetDataAsString(i+1);
     j := j+1;
     SongsGrid.RowCount := SongsGrid.RowCount + 1;
   end;
   SongsGrid.RowCount := SongsGrid.RowCount - 1;
   grid1.Close;

   SingerGrid.RowCount := 2;
   SingerGrid.FixedRows := 1;
   grid2 := IResultSet(v.ResultSet('MusicIndustry.Singer', 'GetSingersInGroup'));
   grid2.Execute(AlbumsGrid.Cells[0,ARow], null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
   SingerGrid.ColCount := grid2.GetColumnCount;
   for i := 0 to grid2.GetColumnCount - 1 do
      SingerGrid.Cells[i,0] := grid2.GetColumnName(i+1);
   j := 1;
   while grid2.Next do
   begin
     for i := 0 to grid2.GetColumnCount - 1 do
        SingerGrid.Cells[i,j] := grid2.GetData(i+1);
     j := j+1;
     SingerGrid.RowCount := SingerGrid.RowCount + 1;
   end;
   SingerGrid.RowCount := SingerGrid.RowCount - 1;
   grid2.Close;

end;

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
   v.Disconnect;
end;

procedure TForm1.BSelectClick(Sender: TObject);
var grid : IResultSet;
    i:integer;
begin
   AlbumsGrid.RowCount := 2;
   grid := IResultSet(v.DynamicSQL(SQLSelect));
   grid.Prepare(null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
   grid.Execute(null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
   i:= 1;
   while grid.Next do
   begin
      AlbumsGrid.Cells[0,i] := grid.GetDataByName('ID');
      AlbumsGrid.Cells[1,i] := grid.GetDataByName('Name');
      AlbumsGrid.Cells[2,i] := grid.GetDataByName('Year');
      AlbumsGrid.Cells[3,i] := grid.GetDataByName('GroupName');
      AlbumsGrid.Cells[4,i] := grid.GetDataByName('LabelName');
      AlbumsGrid.Cells[5,i] := grid.GetDataByName('LabelCity');
      AlbumsGrid.RowCount := AlbumsGrid.RowCount + 1;
      i := i+1;
   end;
   AlbumsGrid.RowCount := AlbumsGrid.RowCount - 1;
   grid.Close;
end;

procedure TForm1.FormCreate(Sender: TObject);
begin
   V := CoFactory.Create;
   AlbumsGrid.Cells[0,0] := 'Ідентифікатор';
   AlbumsGrid.Cells[1,0] := 'Назва альбому';
   AlbumsGrid.Cells[2,0] := 'Рік виходу';
   AlbumsGrid.Cells[3,0] := 'Назва групи';
   AlbumsGrid.Cells[4,0] := 'Назва студії';
   AlbumsGrid.Cells[5,0] := 'Адреса студії';
end;

end.
