object Form1: TForm1
  Left = 291
  Top = 177
  Width = 1024
  Height = 544
  Caption = #1043#1088#1072#1092#1080#1082#1080
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  Menu = MainMenu1
  OldCreateOrder = False
  OnCreate = FormCreate
  OnResize = FormResize
  PixelsPerInch = 96
  TextHeight = 13
  object Image1: TImage
    Left = 0
    Top = 64
    Width = 1920
    Height = 1080
    PopupMenu = PopupMenu1
    OnClick = Image1Click
    OnDblClick = Image1DblClick
    OnMouseDown = Image1MouseDown
    OnMouseMove = Image1MouseMove
    OnMouseUp = Image1MouseUp
  end
  object Label1: TLabel
    Left = 16
    Top = 8
    Width = 81
    Height = 24
    Caption = #1052#1072#1089#1096#1090#1072#1073
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clMaroon
    Font.Height = -19
    Font.Name = 'MS Sans Serif'
    Font.Style = []
    ParentFont = False
  end
  object Label2: TLabel
    Left = 16
    Top = 336
    Width = 56
    Height = 24
    Caption = 'Label2'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clMaroon
    Font.Height = -19
    Font.Name = 'MS Sans Serif'
    Font.Style = []
    ParentFont = False
  end
  object Label3: TLabel
    Left = 16
    Top = 360
    Width = 56
    Height = 24
    Caption = 'Label3'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clMaroon
    Font.Height = -19
    Font.Name = 'MS Sans Serif'
    Font.Style = []
    ParentFont = False
  end
  object TrackBar1: TTrackBar
    Left = 120
    Top = 8
    Width = 417
    Height = 33
    Max = 100
    Min = 1
    Frequency = 2
    Position = 10
    SelEnd = 10
    SelStart = 1
    TabOrder = 0
    OnChange = TrackBar1Change
  end
  object Panel1: TPanel
    Left = 584
    Top = 275
    Width = 361
    Height = 121
    Caption = 'Panel1'
    TabOrder = 1
    Visible = False
    object Label4: TLabel
      Left = 88
      Top = 0
      Width = 151
      Height = 20
      Caption = #1059#1089#1088#1077#1076#1085#1077#1085#1085#1103#1103' '#1083#1080#1085#1080#1103
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clMaroon
      Font.Height = -16
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      ParentFont = False
    end
    object Label5: TLabel
      Left = 104
      Top = 24
      Width = 114
      Height = 13
      Caption = #1059#1088#1086#1074#1077#1085#1100' '#1089#1075#1083#1072#1078#1080#1074#1072#1085#1080#1103
    end
    object TrackBar2: TTrackBar
      Left = 8
      Top = 40
      Width = 345
      Height = 45
      Max = 100
      Min = 3
      Position = 5
      TabOrder = 0
    end
    object Button1: TButton
      Left = 144
      Top = 88
      Width = 75
      Height = 25
      Caption = #1047#1072#1082#1088#1099#1090#1100
      TabOrder = 1
      OnClick = Button1Click
    end
  end
  object Panel2: TPanel
    Left = 808
    Top = 0
    Width = 185
    Height = 337
    Caption = 'Panel2'
    TabOrder = 2
    OnMouseDown = Panel2MouseDown
    object GroupBox1: TGroupBox
      Left = 16
      Top = 32
      Width = 161
      Height = 289
      Caption = #1057#1074#1086#1081#1089#1090#1074#1072
      TabOrder = 0
      object StringGrid1: TStringGrid
        Left = 0
        Top = 16
        Width = 145
        Height = 265
        ColCount = 2
        RowCount = 10
        FixedRows = 0
        Options = [goFixedVertLine, goFixedHorzLine, goVertLine, goHorzLine, goRangeSelect, goColSizing, goEditing]
        TabOrder = 0
        OnDblClick = StringGrid1DblClick
        OnExit = StringGrid1Exit
        OnMouseDown = StringGrid1MouseDown
        OnSelectCell = StringGrid1SelectCell
        OnSetEditText = StringGrid1SetEditText
        ColWidths = (
          64
          74)
        RowHeights = (
          24
          24
          24
          24
          24
          24
          24
          24
          24
          24)
      end
    end
    object ComboBox1: TComboBox
      Left = 16
      Top = 8
      Width = 161
      Height = 21
      ItemHeight = 13
      TabOrder = 1
      Text = #1055#1091#1089#1090#1086
      OnChange = ComboBox1Change
    end
  end
  object OpenDialog1: TOpenDialog
    DefaultExt = 'txt'
    Filter = '*.txt|*.txt|*.* ('#1042#1089#1077' '#1092#1072#1081#1083#1099')|*.*'
    Left = 128
    Top = 176
  end
  object MainMenu1: TMainMenu
    Left = 184
    Top = 176
    object N1: TMenuItem
      Caption = #1060#1072#1081#1083
      object N2: TMenuItem
        Caption = #1057#1086#1079#1076#1072#1090#1100
        OnClick = N2Click
      end
      object N4: TMenuItem
        Caption = #1054#1090#1082#1088#1099#1090#1100
        OnClick = N4Click
      end
      object N11: TMenuItem
        Caption = #1048#1089#1090#1086#1095#1085#1080#1082#1080' '#1076#1072#1085#1085#1099#1093
      end
      object N5: TMenuItem
        Caption = #1057#1086#1093#1088#1072#1085#1080#1090#1100' '#1082#1072#1082'...'
        OnClick = N5Click
      end
      object N14: TMenuItem
        Caption = #1047#1072#1082#1088#1099#1090#1100
        Enabled = False
        OnClick = N14Click
      end
      object N27: TMenuItem
        Caption = #1042#1099#1093#1086#1076
        OnClick = N27Click
      end
    end
    object N6: TMenuItem
      Caption = #1048#1085#1089#1090#1088#1091#1084#1077#1085#1090#1099
      Enabled = False
      object N7: TMenuItem
        Caption = #1056#1091#1082#1072
      end
      object N8: TMenuItem
        Caption = #1051#1080#1085#1080#1103
      end
    end
    object N13: TMenuItem
      Caption = #1042#1080#1076
      object N19: TMenuItem
        Caption = #1062#1074#1077#1090' '#1092#1086#1085#1072
        OnClick = N19Click
      end
      object N20: TMenuItem
        Caption = #1062#1074#1077#1090' '#1092#1080#1082#1089#1080#1088#1086#1074#1072#1085#1085#1099#1093' '#1086#1089#1077#1081
        OnClick = N20Click
      end
      object N21: TMenuItem
        Caption = #1062#1074#1077#1090' '#1087#1086#1076#1074#1080#1078#1085#1099#1093' '#1086#1089#1077#1081
        OnClick = N21Click
      end
    end
    object N9: TMenuItem
      Caption = #1044#1077#1081#1089#1090#1074#1080#1103
      Enabled = False
      object N3: TMenuItem
        Caption = #1057#1086#1079#1076#1072#1090#1100' '#1083#1080#1085#1080#1102' '#1089#1088#1077#1076#1085#1080#1093' '#1090#1086#1095#1077#1082
        OnClick = N3Click
      end
    end
    object N22: TMenuItem
      Caption = #1053#1072#1089#1090#1088#1086#1081#1082#1080
    end
    object N12: TMenuItem
      Caption = #1057#1087#1088#1072#1074#1082#1072
      object N10: TMenuItem
        Caption = #1054' '#1087#1088#1086#1075#1088#1072#1084#1084#1077
        OnClick = N10Click
      end
    end
  end
  object SaveDialog1: TSaveDialog
    DefaultExt = '.txt'
    FileName = 'NoName'
    Filter = 
      '*.txt ('#1056#1072#1079#1076#1077#1083#1080#1090#1077#1083#1100' '#1079#1072#1087#1103#1090#1086#1081')|*.txt|*.txt ('#1056#1072#1079#1076#1077#1083#1080#1090#1077#1083#1100' '#1090#1086#1095#1082#1072')|*.tx' +
      't|*.* ('#1042#1089#1077' '#1092#1072#1081#1083#1099')|*.*'
    Left = 72
    Top = 176
  end
  object PopupMenu1: TPopupMenu
    Left = 560
    Top = 16
    object BMP1: TMenuItem
      Caption = #1042#1099#1076#1077#1083#1077#1085#1080#1077
      OnClick = BMP1Click
    end
    object Matlab1: TMenuItem
      Caption = #1050#1086#1087#1080#1088#1086#1074#1072#1090#1100
      OnClick = Matlab1Click
    end
    object Origin1: TMenuItem
      Caption = #1059#1076#1072#1083#1080#1090#1100' '#1075#1088#1072#1092#1080#1082
      OnClick = Origin1Click
    end
    object Matlab2: TMenuItem
      Caption = #1048#1079#1084#1077#1085#1080#1090#1100
      OnClick = Matlab2Click
    end
    object Origin2: TMenuItem
      Caption = #1055#1077#1088#1077#1076#1072#1090#1100' '#1074' Origin'
      OnClick = Origin2Click
    end
    object N15: TMenuItem
      Caption = #1055#1077#1088#1077#1076#1072#1090#1100' '#1074'  Matlab'
      OnClick = N15Click
    end
    object N18: TMenuItem
      Caption = #1050#1086#1087#1080#1088#1086#1074#1072#1090#1100' '#1080#1079#1086#1073#1088#1072#1078#1077#1085#1080#1077
      OnClick = N18Click
    end
    object BMP2: TMenuItem
      Caption = #1057#1074#1086#1073#1086#1076#1085#1072#1103' '#1090#1088#1072#1085#1089#1092#1086#1088#1084#1072#1094#1080#1103' '#1075#1088#1072#1092#1080#1082#1072
      OnClick = BMP2Click
    end
    object BMP3: TMenuItem
      Caption = #1057#1086#1093#1088#1072#1085#1080#1090#1100' '#1074' '#1092#1086#1088#1084#1072#1090#1077' *.BMP'
      OnClick = BMP3Click
    end
    object N29: TMenuItem
      Caption = #1054#1087#1077#1088#1072#1094#1080#1080' '#1085#1072#1076' '#1075#1088#1072#1092#1080#1082#1086#1084
      object N30: TMenuItem
        Caption = #1059#1084#1085#1086#1078#1080#1090#1100' '#1085#1072' '#1095#1080#1089#1083#1086
        OnClick = N30Click
      end
      object N31: TMenuItem
        Caption = #1056#1072#1079#1076#1077#1083#1080#1090#1100' '#1085#1072' '#1095#1080#1089#1083#1086
        OnClick = N31Click
      end
      object N32: TMenuItem
        Caption = #1055#1088#1080#1073#1072#1074#1080#1090#1100' '#1095#1080#1089#1083#1086
        OnClick = N32Click
      end
      object N33: TMenuItem
        Caption = #1054#1090#1085#1103#1090#1100' '#1095#1080#1089#1083#1086
        OnClick = N33Click
      end
      object N34: TMenuItem
        Caption = #1055#1086#1083#1086#1078#1080#1090#1100' '#1085#1072' '#1086#1089#1100' '#1072#1073#1089#1094#1080#1089#1089
        OnClick = N34Click
      end
      object N16: TMenuItem
        Caption = #1055#1086#1083#1091#1095#1080#1090#1100' '#1054#1087#1090#1080#1095#1077#1089#1082#1091#1102' '#1087#1083#1086#1090#1085#1086#1089#1090#1100
      end
    end
    object N36: TMenuItem
      Caption = #1054#1087#1077#1088#1072#1094#1080#1080' '#1085#1072#1076' '#1076#1074#1091#1084#1103' '#1075#1088#1072#1092#1080#1082#1072#1084#1080
      object N37: TMenuItem
        Caption = #1057#1091#1084#1084#1072' '#1075#1088#1072#1092#1080#1082#1086#1074
        OnClick = N37Click
      end
      object N38: TMenuItem
        Caption = #1042#1099#1095#1077#1089#1090#1100' '#1075#1088#1072#1092#1080#1082
        OnClick = N38Click
      end
      object N39: TMenuItem
        Caption = #1053#1086#1088#1084#1080#1088#1086#1074#1072#1090#1100' '#1089' '#1076#1088#1091#1075#1080#1084' '#1075#1088#1072#1092#1080#1082#1086#1084
        OnClick = N39Click
      end
    end
    object N40: TMenuItem
      Caption = #1069#1082#1089#1087#1086#1088#1090' '#1074' '#1090#1077#1082#1089#1090#1086#1074#1099#1081' '#1092#1086#1088#1084#1072#1090
      OnClick = N40Click
    end
  end
  object SavePictureDialog1: TSavePictureDialog
    Left = 152
    Top = 80
  end
  object OpenDialog2: TOpenDialog
    DefaultExt = '*.exe'
    Filter = '*.exe'
    Left = 608
    Top = 16
  end
  object PopupMenu3: TPopupMenu
    Left = 456
    Top = 128
    object N28: TMenuItem
      Caption = #1059#1076#1072#1083#1080#1090#1100
      OnClick = N28Click
    end
  end
  object ColorDialog1: TColorDialog
    Left = 352
    Top = 144
  end
  object TcpServer1: TTcpServer
    LocalHost = '0.0.0.0'
    LocalPort = '49111'
    OnAccept = TcpServer1Accept
    Left = 656
    Top = 16
  end
  object TcpClient1: TTcpClient
    Left = 696
    Top = 16
  end
  object Timer1: TTimer
    Enabled = False
    OnTimer = Timer1Timer
    Left = 48
    Top = 32
  end
  object Timer2: TTimer
    Interval = 500
    OnTimer = Timer2Timer
    Left = 760
    Top = 40
  end
end
