object Form1: TForm1
  Left = 0
  Top = 0
  Caption = #1054#1073#8217#1108#1082#1090#1085#1080#1081' '#1076#1086#1089#1090#1091#1087
  ClientHeight = 431
  ClientWidth = 962
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
    Width = 962
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
      Left = 302
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
    object CallMethod: TButton
      Left = 201
      Top = 8
      Width = 75
      Height = 25
      Caption = 'CallMethod'
      TabOrder = 3
      OnClick = CallMethodClick
    end
  end
  object Panel3: TPanel
    Left = 0
    Top = 186
    Width = 962
    Height = 245
    Align = alBottom
    TabOrder = 1
    object Participants: TDrawGrid
      Left = 1
      Top = 1
      Width = 551
      Height = 243
      Align = alClient
      FixedCols = 0
      RowCount = 2
      TabOrder = 0
      ColWidths = (
        112
        162
        64
        28
        169)
    end
    object Log: TStringGrid
      Left = 552
      Top = 1
      Width = 409
      Height = 243
      Align = alRight
      ColCount = 2
      FixedCols = 0
      RowCount = 2
      Options = [goFixedVertLine, goFixedHorzLine, goVertLine, goHorzLine, goColMoving, goRowSelect]
      TabOrder = 1
      ColWidths = (
        112
        281)
    end
  end
  object Panel2: TPanel
    Left = 0
    Top = 41
    Width = 962
    Height = 145
    Align = alClient
    TabOrder = 2
    object GroupsTopics: TStringGrid
      Left = 1
      Top = 1
      Width = 960
      Height = 143
      Align = alClient
      ColCount = 4
      FixedCols = 0
      RowCount = 2
      Options = [goFixedVertLine, goFixedHorzLine, goVertLine, goHorzLine, goRangeSelect, goRowSizing, goColSizing]
      TabOrder = 0
      OnSelectCell = GroupsTopicsSelectCell
      ColWidths = (
        130
        281
        198
        175)
    end
  end
end
