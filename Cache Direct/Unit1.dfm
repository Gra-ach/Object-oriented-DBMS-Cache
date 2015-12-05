object Form1: TForm1
  Left = 0
  Top = 0
  BorderStyle = bsDialog
  Caption = #1058#1077#1089#1090' '#1087#1088#1103#1084#1086#1075#1086' '#1076#1086#1089#1090#1091#1087#1091
  ClientHeight = 324
  ClientWidth = 448
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  Position = poDesktopCenter
  OnClose = FormClose
  PixelsPerInch = 96
  TextHeight = 13
  object Panel1: TPanel
    Left = 0
    Top = 0
    Width = 448
    Height = 41
    Align = alTop
    TabOrder = 0
    DesignSize = (
      448
      41)
    object Button0: TButton
      Left = 13
      Top = 7
      Width = 75
      Height = 25
      Caption = 'Connect'
      TabOrder = 0
      OnClick = Button0Click
    end
    object Button1: TButton
      Left = 361
      Top = 7
      Width = 75
      Height = 25
      Anchors = [akTop, akRight]
      Caption = 'Disconnect'
      TabOrder = 1
      OnClick = Button1Click
    end
    object Button2: TButton
      Left = 216
      Top = 7
      Width = 121
      Height = 25
      Caption = 'GetAllSeriesNames'
      TabOrder = 2
      OnClick = Button2Click
    end
    object Button3: TButton
      Left = 112
      Top = 7
      Width = 75
      Height = 25
      Caption = 'CreateGlobal'
      TabOrder = 3
      OnClick = Button3Click
    end
  end
  object Panel2: TPanel
    Left = 0
    Top = 251
    Width = 448
    Height = 73
    Align = alBottom
    TabOrder = 1
    object Memo1: TMemo
      Left = 1
      Top = 1
      Width = 446
      Height = 71
      Align = alClient
      TabOrder = 0
    end
  end
  object Panel3: TPanel
    Left = 0
    Top = 41
    Width = 448
    Height = 210
    Align = alClient
    TabOrder = 2
    object Label1: TLabel
      Left = 13
      Top = 9
      Width = 74
      Height = 13
      Caption = #1053#1072#1079#1074#1072' '#1089#1077#1088#1110#1072#1083#1091':'
    end
    object Label2: TLabel
      Left = 13
      Top = 36
      Width = 62
      Height = 13
      Caption = #1056#1110#1082' '#1074#1080#1087#1091#1089#1082#1091':'
    end
    object Label4: TLabel
      Left = 13
      Top = 61
      Width = 81
      Height = 13
      Caption = #1040#1082#1090#1086#1088#1080' '#1089#1077#1088#1110#1072#1083#1091':'
    end
    object ComboBox1: TComboBox
      Left = 93
      Top = 6
      Width = 341
      Height = 21
      Style = csDropDownList
      TabOrder = 0
      OnChange = ComboBox1Change
    end
    object ComboBox2: TComboBox
      Left = 93
      Top = 33
      Width = 341
      Height = 21
      Style = csDropDownList
      TabOrder = 1
      OnChange = ComboBox2Change
    end
    object ListBox1: TListBox
      Left = 13
      Top = 80
      Width = 421
      Height = 115
      ItemHeight = 13
      TabOrder = 2
    end
  end
end
