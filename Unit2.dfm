object Form2: TForm2
  Left = 767
  Top = 323
  Width = 376
  Height = 196
  AutoSize = True
  Caption = #1044#1077#1081#1089#1090#1074#1080#1077' '#1085#1072#1076' '#1075#1088#1072#1092#1080#1082#1086#1084
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  PixelsPerInch = 96
  TextHeight = 13
  object Label1: TLabel
    Left = 16
    Top = 0
    Width = 54
    Height = 23
    Alignment = taCenter
    Caption = 'Label1'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clMaroon
    Font.Height = -19
    Font.Name = 'Tahoma'
    Font.Style = []
    ParentFont = False
  end
  object Label2: TLabel
    Left = 8
    Top = 40
    Width = 31
    Height = 13
    Alignment = taCenter
    Caption = 'Label2'
  end
  object Label3: TLabel
    Left = 0
    Top = 144
    Width = 360
    Height = 13
    Caption = 
      '                                                                ' +
      '                                                        '
  end
  object Edit1: TEdit
    Left = 80
    Top = 72
    Width = 201
    Height = 21
    TabOrder = 0
    Text = 'Edit1'
  end
  object BitBtn1: TBitBtn
    Left = 72
    Top = 112
    Width = 75
    Height = 25
    TabOrder = 1
    OnClick = BitBtn1Click
    Kind = bkOK
  end
  object BitBtn2: TBitBtn
    Left = 216
    Top = 112
    Width = 75
    Height = 25
    TabOrder = 2
    Kind = bkClose
  end
end
