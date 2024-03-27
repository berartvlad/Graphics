object Form3: TForm3
  Left = 344
  Top = 421
  Width = 432
  Height = 318
  AutoSize = True
  Caption = #1054#1087#1077#1088#1072#1094#1080#1080' '#1085#1072#1076' '#1075#1088#1072#1092#1080#1082#1072#1084#1080
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
    Left = 64
    Top = 0
    Width = 316
    Height = 25
    Caption = #1054#1087#1077#1088#1072#1094#1080#1080' '#1085#1072#1076' '#1076#1074#1091#1084#1103' '#1075#1088#1072#1092#1080#1082#1072#1084#1080
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clMaroon
    Font.Height = -21
    Font.Name = 'Tahoma'
    Font.Style = []
    ParentFont = False
  end
  object Label2: TLabel
    Left = 0
    Top = 40
    Width = 153
    Height = 13
    Caption = '    '#1042#1099#1073#1077#1088#1080#1090#1077' '#1075#1088#1072#1092#1080#1082' '#1080#1079' '#1089#1087#1080#1089#1082#1072
  end
  object Label3: TLabel
    Left = 0
    Top = 72
    Width = 153
    Height = 13
    Caption = '    '#1042#1099#1073#1077#1088#1080#1090#1077' '#1075#1088#1072#1092#1080#1082' '#1080#1079' '#1089#1087#1080#1089#1082#1072
  end
  object Label4: TLabel
    Left = 0
    Top = 104
    Width = 193
    Height = 13
    Caption = '    '#1042#1099#1073#1077#1088#1080#1090#1077' '#1076#1077#1081#1089#1090#1074#1080#1077' '#1085#1072#1076' '#1075#1088#1072#1092#1080#1082#1072#1084#1080
  end
  object Label5: TLabel
    Left = 0
    Top = 136
    Width = 115
    Height = 13
    Caption = '    '#1048#1084#1103' '#1085#1086#1074#1086#1075#1086' '#1075#1088#1072#1092#1080#1082#1072
  end
  object Label6: TLabel
    Left = 8
    Top = 240
    Width = 408
    Height = 39
    Caption = 
      #1042#1099#1073#1088#1072#1090#1100' '#1075#1088#1072#1092#1080#1082' '#1084#1086#1078#1085#1086' '#1082#1072#1082' '#1080#1079' '#1089#1087#1080#1089#1082#1072', '#1090#1072#1082' '#1080' '#1084#1099#1096#1100#1102', '#1091#1082#1072#1079#1072#1074' '#1085#1072' '#1085#1091#1078#1085#1099 +
      #1081' '#1075#1088#1072#1092#1080#1082' '#13#10#1076#1074#1086#1081#1085#1099#1084' '#1097#1077#1083#1095#1082#1086#1084'. '#1053#1086' '#1087#1077#1088#1077#1076' '#1101#1090#1080#1084' '#1085#1077#1086#1073#1093#1086#1076#1080#1084#1086' '#1091#1089#1090#1072#1085#1086#1074#1080#1090#1100' ' +
      #1082#1091#1088#1089#1086#1088' '#1085#1072' '#1087#1077#1088#1074#1099#1081' '#13#10#1080#1083#1080' '#1074#1090#1086#1088#1086#1081' '#1086#1087#1077#1088#1072#1085#1076'.'
  end
  object ComboBox1: TComboBox
    Left = 200
    Top = 40
    Width = 145
    Height = 21
    ItemHeight = 13
    TabOrder = 0
    Text = #1042#1099#1073#1077#1088#1080#1090#1077' '#1087#1077#1088#1074#1099#1081' '#1075#1088#1072#1092#1080#1082
    OnChange = ComboBox1Change
    OnEnter = ComboBox1Enter
  end
  object ComboBox2: TComboBox
    Left = 200
    Top = 72
    Width = 145
    Height = 21
    ItemHeight = 13
    TabOrder = 1
    Text = #1042#1099#1073#1077#1088#1080#1090#1077' '#1074#1090#1086#1088#1086#1081' '#1075#1088#1072#1092#1080#1082
    OnChange = ComboBox2Change
    OnEnter = ComboBox2Enter
  end
  object ComboBox3: TComboBox
    Left = 200
    Top = 104
    Width = 145
    Height = 21
    ItemHeight = 13
    TabOrder = 2
    Text = #1042#1099#1073#1077#1088#1080#1090#1077' '#1076#1077#1081#1089#1090#1074#1080#1077
    OnChange = ComboBox3Change
    Items.Strings = (
      #1057#1091#1084#1084#1072
      #1056#1072#1079#1085#1086#1089#1090#1100
      #1053#1086#1088#1084#1080#1088#1086#1074#1072#1085#1080#1077)
  end
  object Edit1: TEdit
    Left = 136
    Top = 136
    Width = 257
    Height = 21
    TabOrder = 3
    Text = 'Edit1'
  end
  object BitBtn1: TBitBtn
    Left = 64
    Top = 200
    Width = 89
    Height = 33
    TabOrder = 4
    OnClick = BitBtn1Click
    Kind = bkOK
  end
  object BitBtn2: TBitBtn
    Left = 224
    Top = 200
    Width = 89
    Height = 33
    Caption = #1054#1090#1084#1077#1085#1080#1090#1100
    TabOrder = 5
    OnClick = BitBtn2Click
    Kind = bkClose
  end
  object CheckBox1: TCheckBox
    Left = 8
    Top = 168
    Width = 385
    Height = 17
    Caption = #1053#1086#1088#1084#1080#1088#1086#1074#1072#1090#1100' '#1090#1086#1083#1100#1082#1086' '#1087#1086' Y ('#1054#1089#1080' '#1086#1088#1076#1080#1085#1072#1090')'
    Checked = True
    State = cbChecked
    TabOrder = 6
    Visible = False
  end
end
