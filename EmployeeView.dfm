object frmEmployeeView: TfrmEmployeeView
  Left = 0
  Top = 0
  Caption = 'PayRates Employee Signed In'
  ClientHeight = 367
  ClientWidth = 370
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  PixelsPerInch = 96
  TextHeight = 13
  object edtSearchBar: TEdit
    Left = 8
    Top = 80
    Width = 272
    Height = 21
    TabOrder = 0
  end
  object btnSearch: TButton
    Left = 286
    Top = 78
    Width = 75
    Height = 25
    Caption = 'Search'
    TabOrder = 1
  end
  object redOut: TRichEdit
    Left = 8
    Top = 107
    Width = 353
    Height = 252
    Font.Charset = ANSI_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'Tahoma'
    Font.Style = []
    ParentFont = False
    TabOrder = 2
  end
  object pnlHeading: TPanel
    Left = -2
    Top = -1
    Width = 379
    Height = 73
    Caption = 'PayRate'
    Color = clTeal
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -60
    Font.Name = 'zerpixl'
    Font.Style = []
    ParentBackground = False
    ParentFont = False
    ParentShowHint = False
    ShowHint = False
    TabOrder = 3
  end
end
