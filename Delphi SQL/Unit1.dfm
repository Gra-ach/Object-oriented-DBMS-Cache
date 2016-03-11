object Form1: TForm1
  Left = 0
  Top = 0
  Caption = 'SQL '#1076#1086#1089#1090#1091#1087
  ClientHeight = 360
  ClientWidth = 684
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  OnCreate = FormCreate
  PixelsPerInch = 96
  TextHeight = 13
  object Panel1: TPanel
    Left = 0
    Top = 0
    Width = 684
    Height = 41
    Align = alTop
    TabOrder = 0
    object BConnect: TButton
      Left = 8
      Top = 8
      Width = 75
      Height = 25
      Caption = 'Connect'
      TabOrder = 0
      OnClick = BConnectClick
    end
    object BDisconnect: TButton
      Left = 200
      Top = 8
      Width = 75
      Height = 25
      Caption = 'Disconnect'
      TabOrder = 1
      OnClick = BDisconnectClick
    end
    object BSelect: TButton
      Left = 104
      Top = 8
      Width = 75
      Height = 25
      Caption = 'Select'
      TabOrder = 2
      OnClick = BSelectClick
    end
  end
  object Panel2: TPanel
    Left = 0
    Top = 41
    Width = 684
    Height = 174
    Align = alClient
    TabOrder = 1
    object AlbumsGrid: TStringGrid
      Left = 1
      Top = 1
      Width = 682
      Height = 172
      Align = alClient
      ColCount = 6
      FixedCols = 0
      RowCount = 2
      Options = [goFixedVertLine, goFixedHorzLine, goVertLine, goHorzLine, goRangeSelect, goRowSizing, goColSizing, goRowSelect]
      TabOrder = 0
      OnSelectCell = AlbumsGridSelectCell
      ColWidths = (
        87
        125
        69
        120
        140
        102)
    end
  end
  object Panel3: TPanel
    Left = 0
    Top = 215
    Width = 684
    Height = 145
    Align = alBottom
    TabOrder = 2
    object SongsGrid: TStringGrid
      Left = 1
      Top = 1
      Width = 274
      Height = 143
      Align = alLeft
      ColCount = 2
      FixedCols = 0
      RowCount = 2
      Options = [goFixedVertLine, goFixedHorzLine, goVertLine, goHorzLine, goRangeSelect, goColSizing]
      TabOrder = 0
      ColWidths = (
        90
        149)
    end
    object SingerGrid: TStringGrid
      Left = 275
      Top = 1
      Width = 408
      Height = 143
      Align = alClient
      ColCount = 3
      FixedCols = 0
      RowCount = 2
      Options = [goFixedVertLine, goFixedHorzLine, goVertLine, goHorzLine, goRangeSelect, goRowSizing, goColSizing]
      TabOrder = 1
      ColWidths = (
        94
        176
        89)
      RowHeights = (
        24
        24)
    end
  end
end
